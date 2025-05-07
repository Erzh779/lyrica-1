import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:poem/src/features/music/model/music.dart';
import 'package:poem/src/features/poems/model/create_poem_data.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

/// {@template poems_repository}
/// An interface for managing poems in a repository.
///
/// This interface defines the contract for performing CRUD operations
/// on poems, including querying, creating, updating, and deleting poems.
/// {@endtemplate}
abstract interface class IPoemsRepository {
  /// Retrieves a list of all poems.
  ///
  /// Returns a [Future] that completes with a list of [Poem] objects.
  Future<List<Poem>> queryPoems();

  /// Retrieves a specific poem by its unique identifier.
  ///
  /// [id] - The unique identifier of the poem to retrieve.
  ///
  /// Returns a [Future] that completes with the [Poem] object.
  Future<Poem> queryPoem(
    String id,
  );

  /// Creates a new poem in the repository.
  ///
  /// [poem] - The data required to create a new poem, encapsulated in a [CreatePoemData] object.
  ///
  /// Returns a [Future] that completes with the newly created [Poem] object.
  Future<Poem> createPoem(
    CreatePoemData poem,
  );

  /// Updates an existing poem in the repository.
  ///
  /// [poem] - The existing [Poem] object to update.
  /// [data] - The new data to update the poem with, encapsulated in a [CreatePoemData] object.
  ///
  /// Returns a [Future] that completes with the updated [Poem] object.
  Future<Poem> updatePoem(
    Poem poem,
    CreatePoemData data,
  );

  /// Deletes a poem from the repository.
  ///
  /// [poem] - The [Poem] object to delete.
  ///
  /// Returns a [Future] that completes when the poem is successfully deleted.
  Future<void> deletePoem(
    Poem poem,
  );
}

/// {@macro poems_repository}
///
/// An implementation of the [IPoemsRepository] interface that uses Supabase as the backend.
class PoemsRepository$Supabase implements IPoemsRepository {
  SupabaseClient get _client => Supabase.instance.client;

  SupabaseQueryBuilder get _poems => _client.from('poems');

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
  Future<Poem> createPoem(
    CreatePoemData poem,
  ) async {
    try {
      // upload cover image if provided
      String? coverUrl;

      if (poem.cover != null) {
        final file = File(poem.cover!);
        coverUrl = await _uploadFile('images', file);
      }

      // create a new poem in the database
      final response = await _poems
          .insert({
            'title': poem.title,
            'content': poem.content,
            'cover': coverUrl,
            'music_id': poem.music?.id,
            'font_family': poem.fontFamily,
          })
          .select()
          .single();

      return Poem.fromJson(response).copyWith(
        music: () => poem.music,
      );
    } on Object {
      rethrow; // or Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> deletePoem(
    Poem poem,
  ) =>
      _poems.delete().eq('id', poem.id);

  @override
  Future<Poem> queryPoem(
    String id,
  ) async {
    final response = await _poems.select().eq('id', id).single();
    return Poem.fromJson(response);
  }

  @override
  Future<List<Poem>> queryPoems() async {
    final userId = _client.auth.currentUser!.id;

    final response = await _poems
        .select()
        .eq('author_id', userId)
        .order('created_at', ascending: false);

    final poems = (response as List)
        .map((e) => Poem.fromJson(e as Map<String, Object?>))
        .toList();

    final musicIds = poems.map((e) => e.musicId).whereType<int>().toList();
    if (musicIds.isEmpty) return poems;

    final musicResponse =
        await _client.from('music').select().inFilter('id', musicIds);

    final music = (musicResponse as List)
        .map((e) => Music.fromJson(e as Map<String, Object?>))
        .toList()
        .asMap()
        .map((index, e) => MapEntry(musicIds[index], e));

    return poems.map((e) {
      final musicId = e.musicId;
      return e.copyWith(music: () => music[musicId]);
    }).toList();
  }

  @override
  Future<Poem> updatePoem(
    Poem poem,
    CreatePoemData data,
  ) {
    // TODO: implement updatePoem
    throw UnimplementedError();
  }
}
