import 'package:meta/meta.dart';
import 'package:poem/src/features/music/model/music.dart';

/// {@template poem}
/// A model class representing a poem.
///
/// This class is immutable and contains all the necessary information
/// about a poem, including its metadata and content.
/// {@endtemplate}
@immutable
class Poem {
  /// The unique identifier for the poem.
  final int id;

  /// The title of the poem.
  final String title;

  /// The main content of the poem.
  final String content;

  /// An optional URL to the cover image of the poem.
  final String? cover;

  /// An optional music of the poem.
  final Music? music;

  /// An optional music id of the poem.
  final int? musicId;

  /// The unique identifier of the author who created the poem.
  final String authorId;

  /// The date and time when the poem was created.
  final DateTime createdAt;

  /// An optional date and time when the poem was last updated.
  final DateTime? updatedAt;

  /// An optional date and time when the poem was published.
  final DateTime? publishedAt;

  /// An optional font family used for displaying the poem.
  final String? fontFamily;

  /// {@macro poem}
  const Poem({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
    required this.music,
    required this.musicId,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.fontFamily,
  });

  /// Creates a copy of the current poem with the given parameters.
  Poem copyWith({
    int? id,
    String? title,
    String? content,
    String? Function()? cover,
    Music? Function()? music,
    int? Function()? musicId,
    String? authorId,
    DateTime? createdAt,
    DateTime? Function()? updatedAt,
    DateTime? Function()? publishedAt,
    String? Function()? fontFamily,
  }) =>
      Poem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        cover: cover != null ? cover() : this.cover,
        music: music != null ? music() : this.music,
        musicId: musicId != null ? musicId() : this.musicId,
        authorId: authorId ?? this.authorId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt != null ? updatedAt() : this.updatedAt,
        publishedAt: publishedAt != null ? publishedAt() : this.publishedAt,
        fontFamily: fontFamily != null ? fontFamily() : this.fontFamily,
      );

  /// Creates a new instance of [Poem] from a JSON map.
  factory Poem.fromJson(Map<String, Object?> json) => Poem(
        id: json['id'] as int,
        title: json['title'] as String,
        content: json['content'] as String,
        cover: json['cover'] as String?,
        music: json['music'] != null
            ? Music.fromJson(json['music'] as Map<String, Object?>)
            : null,
        musicId:
            (json['music_id'] as int?) != null ? json['music_id'] as int : null,
        authorId: json['author_id'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: (json['updated_at'] as String?) != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
        publishedAt: (json['published_at'] as String?) != null
            ? DateTime.parse(json['published_at'] as String)
            : null,
        fontFamily: json['font_family'] as String?,
      );

  /// Converts the current instance of [Poem] to a JSON map.
  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'content': content,
        'cover': cover,
        'music': music?.toJson(),
        'music_id': musicId,
        'author_id': authorId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'published_at': publishedAt?.toIso8601String(),
        'font_family': fontFamily,
      };

  /// Returns a string representation of the poem.
  @override
  String toString() => 'Poem(id: $id, title: $title, content: $content, '
      'cover: $cover, music: $music, musicId: $musicId, authorId: $authorId, createdAt: $createdAt, '
      'updatedAt: $updatedAt, publishedAt: $publishedAt, fontFamily: $fontFamily)';

  /// Checks if two poems are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Poem &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.cover == cover &&
        other.music == music &&
        other.musicId == musicId &&
        other.authorId == authorId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.publishedAt == publishedAt &&
        other.fontFamily == fontFamily;
  }

  /// Returns a hash code for the poem.
  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      cover.hashCode ^
      music.hashCode ^
      musicId.hashCode ^
      authorId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      publishedAt.hashCode ^
      fontFamily.hashCode;
}
