import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:poem/src/features/music/model/genre.dart';
import 'package:poem/src/features/music/model/music.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

/// An abstract interface class that defines the contract for a music repository.
/// This repository provides methods for querying and creating music data.
abstract interface class IMusicRepository {
  /// Queries and retrieves a list of music items.
  ///
  /// Returns a [Future] that resolves to a list of [Music] objects.
  Future<List<Music>> queryMusics();

  /// Creates a new music entry with the given title and file.
  ///
  /// Parameters:
  /// - [title]: The title of the music. This is a required parameter.
  /// - [file]: The file associated with the music. This is a required parameter.
  /// - [genreId]: The ID of the genre associated with the music. This is an optional parameter.
  /// - [newGenreTitle]: The title of a new genre to be created if it doesn't exist. This is an optional parameter.
  ///
  /// Returns a [Future] that resolves to the created [Music] object.
  Future<Music> createMusic({
    required String title,
    required Genre genre,
    required File file,
  });

  /// Queries and retrieves a list of genres.
  ///
  /// Returns a [Future] that resolves to a list of [Genre] objects.
  Future<List<Genre>> queryGenres();
}

/// MusicRepository is an implementation of the IMusicRepository interface.
class MusicRepository implements IMusicRepository {
  SupabaseClient get _client => Supabase.instance.client;

  SupabaseQueryBuilder get _genre => _client.from('genre');

  SupabaseQueryBuilder get _music => _client.from('music');

  SupabaseStorageClient get _storage => _client.storage;

  static Uuid? _uuidCache;

  /// A singleton instance of [Uuid] for generating unique identifiers.
  static Uuid get _uuid => _uuidCache ??= const Uuid();

  /// Upload file to Supabase storage.
  Future<String> _uploadFile(String $path, File file) async {
    final storage = _storage.from($path);
    final extension = path.extension(file.path);
    final fileName = '${_uuid.v4()}$extension';
    final filePath = '${$path}/$fileName';

    await storage.upload(filePath, file);

    return storage.getPublicUrl(filePath);
  }

  @override
  Future<Music> createMusic({
    required String title,
    required Genre genre,
    required File file,
  }) async {
    try {
      // upload the music file to Supabase storage
      final filePath = await _uploadFile('audio', file);

      // create a new music entry in the database
      final response = await _music
          .insert({
            'title': title,
            'path': filePath,
            'genre_id': genre.id,
          })
          .select()
          .single();

      return Music.fromJson(response).copyWith(
        genre: () => genre,
      );
    } on Object {
      rethrow; // or Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<List<Genre>> queryGenres() async {
    try {
      // Query all genres from the database
      final response = await _genre.select();

      // Convert the response data into a list of Genre objects
      return (response as List)
          .map((item) => Genre.fromJson(item as Map<String, Object?>))
          .toList();
    } on Object {
      rethrow; // or Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<List<Music>> queryMusics() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;

      // Query all music entries from the database
      final owned = await _music.select().eq('owner_id', userId).order(
            'created_at',
            ascending: false,
          );

      final public = await _music.select().isFilter('owner_id', null).order(
            'created_at',
            ascending: false,
          );

      final response = [...owned, ...public]..sort(
          (a, b) {
            final aCreatedAt = DateTime.parse(a['created_at'] as String);
            final bCreatedAt = DateTime.parse(b['created_at'] as String);

            return bCreatedAt.compareTo(aCreatedAt);
          },
        );

      // Convert the response data into a list of Music objects
      final musics = (response as List)
          .map((item) => Music.fromJson(item as Map<String, Object?>))
          .toList();

      final genres = await queryGenres();

      final genresMap = <int, Genre>{};
      for (final genre in genres) genresMap[genre.id] = genre;

      // Update the genre of each music entry using the genresMap
      final musicsWithGenres = musics.map((music) {
        final genre = genresMap[music.genreId];
        return music.copyWith(
          genre: () => genre,
        );
      }).toList();

      return musicsWithGenres;
    } on Object {
      rethrow; // or Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
