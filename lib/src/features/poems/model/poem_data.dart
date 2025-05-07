import 'package:poem/src/features/music/model/music.dart';

/// {@template create_poem_data}
/// A model class representing the data of a poem that will be used to create or update a poem.
/// A data model representing a poem.
///
/// This class contains the essential information about a poem, including
/// its title, content, and optional metadata such as cover image, audio file,
/// and font family.
/// {@endtemplate}
class PoemData {
  /// The title of the poem.
  final String title;

  /// The content of the poem.
  final String content;

  /// An optional path to the cover image of the poem.
  final String? cover;

  /// An optional path to the original cover image of the poem.
  /// This is used to identify the original cover image when updating the poem.
  final String? originalCover;

  /// An optional path to the audio file associated with the poem.
  final Music? music;

  /// An optional font family name to be used for displaying the poem.
  final String? fontFamily;

  /// {@macro poem_data}
  const PoemData({
    required this.title,
    required this.content,
    this.cover,
    this.originalCover,
    this.music,
    this.fontFamily,
  });

  /// Creates a copy of this [PoemData] with optional new values.
  PoemData copyWith({
    String? title,
    String? content,
    String? Function()? cover,
    String? Function()? originalCover,
    Music? Function()? music,
    String? Function()? fontFamily,
  }) =>
      PoemData(
        title: title ?? this.title,
        content: content ?? this.content,
        cover: cover != null ? cover() : this.cover,
        music: music != null ? music() : this.music,
        fontFamily: fontFamily != null ? fontFamily() : this.fontFamily,
      );

  /// Converts a JSON map into a [PoemData] instance.
  factory PoemData.fromJson(Map<String, Object?> json) => PoemData(
        title: json['title'] as String,
        content: json['content'] as String,
        cover: json['cover'] as String?,
        originalCover: json['originalCover'] as String?,
        music: json['music'] != null ? Music.fromJson(json['music'] as Map<String, Object?>) : null,
        fontFamily: json['fontFamily'] as String?,
      );

  /// Converts this [PoemData] instance into a JSON map.
  Map<String, Object?> toJson() => {
        'title': title,
        'content': content,
        'cover': cover,
        'originalCover': originalCover,
        'music': music?.toJson(),
        'fontFamily': fontFamily,
      };

  @override
  String toString() =>
      'PoemData(title: $title, content: $content, cover: $cover, originalCover: $originalCover, music: $music, fontFamily: $fontFamily)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PoemData &&
        other.title == title &&
        other.content == content &&
        other.cover == cover &&
        other.originalCover == originalCover &&
        other.music == music &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode => Object.hash(
        title,
        content,
        cover,
        originalCover,
        music,
        fontFamily,
      );
}
