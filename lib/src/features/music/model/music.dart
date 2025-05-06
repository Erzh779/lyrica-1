import 'package:poem/src/features/music/model/genre.dart';

/// {@template music}
/// Music model
/// {@endtemplate}
class Music {
  /// {@macro music}
  const Music({
    required this.id,
    required this.title,
    required this.artist,
    required this.url,
    required this.genreId,
    this.genre,
    this.ownerId,
  });

  /// The unique identifier for the music.
  final int id;

  /// The title of the music.
  final String title;

  /// The artist of the music.
  final String? artist;

  /// The URL of the music.
  final String url;

  /// The genre id of the music.
  final int genreId;

  /// The genre of the music.
  final Genre? genre;

  /// Owner identifier of the music.
  ///
  /// If `null`, the music is system/predefined music.
  final String? ownerId;

  /// Creates a copy of the current music with the given parameters.
  Music copyWith({
    int? id,
    String? title,
    String? artist,
    String? url,
    int? genreId,
    Genre? Function()? genre,
    String? Function()? ownerId,
  }) =>
      Music(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        url: url ?? this.url,
        genreId: genreId ?? this.genreId,
        genre: genre != null ? genre() : this.genre,
        ownerId: ownerId != null ? ownerId() : this.ownerId,
      );

  /// Converts a JSON map into a [Music] instance.
  factory Music.fromJson(Map<String, Object?> json) => Music(
        id: json['id'] as int,
        title: json['title'] as String,
        artist: json['artist'] as String?,
        url: json['path'] as String,
        genreId: json['genre_id'] as int,
        genre: json['genre'] != null
            ? Genre.fromJson(json['genre'] as Map<String, Object?>)
            : null,
        ownerId: json['owner_id'] as String?,
      );

  /// Converts this [Music] instance into a JSON map.
  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'artist': artist,
        'path': url,
        'genre_id': genreId,
        'genre': genre?.toJson(),
        'owner_id': ownerId,
      };

  /// Converts this [Music] instance into a string representation.
  @override
  String toString() =>
      'Music(id: $id, title: $title, artist: $artist, url: $url, genre: $genre, ownerId: $ownerId, genreId: $genreId)';

  /// Compares this [Music] instance with another [Music] instance.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Music &&
          id == other.id &&
          title == other.title &&
          artist == other.artist &&
          url == other.url &&
          genre == other.genre &&
          ownerId == other.ownerId &&
          genreId == other.genreId;

  /// Generates a hash code for this [Music] instance.
  @override
  int get hashCode =>
      Object.hash(id, title, artist, url, genre, ownerId, genreId);
}
