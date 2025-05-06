import 'package:poem/src/features/music/model/music.dart';

/// {@template create_poem_data}
/// A model class representing the data of a poem that will be used to create or update a poem.
/// A data model representing a poem.
///
/// This class contains the essential information about a poem, including
/// its title, content, and optional metadata such as cover image, audio file,
/// and font family.
/// {@endtemplate}
class CreatePoemData {
  /// The title of the poem.
  final String title;

  /// The content of the poem.
  final String content;

  /// An optional path to the cover image of the poem.
  final String? cover;

  /// An optional path to the audio file associated with the poem.
  final Music? music;

  /// An optional font family name to be used for displaying the poem.
  final String? fontFamily;

  /// {@macro poem_data}
  const CreatePoemData({
    required this.title,
    required this.content,
    this.cover,
    this.music,
    this.fontFamily,
  });

  /// Creates a copy of this [CreatePoemData] with optional new values.
  CreatePoemData copyWith({
    String? title,
    String? content,
    String? cover,
    Music? Function()? music,
    String? fontFamily,
  }) =>
      CreatePoemData(
        title: title ?? this.title,
        content: content ?? this.content,
        cover: cover ?? this.cover,
        music: music != null ? music() : this.music,
        fontFamily: fontFamily ?? this.fontFamily,
      );

  /// Converts a JSON map into a [CreatePoemData] instance.
  factory CreatePoemData.fromJson(Map<String, Object?> json) => CreatePoemData(
        title: json['title'] as String,
        content: json['content'] as String,
        cover: json['cover'] as String?,
        music: json['music'] != null
            ? Music.fromJson(json['music'] as Map<String, Object?>)
            : null,
        fontFamily: json['fontFamily'] as String?,
      );

  /// Converts this [CreatePoemData] instance into a JSON map.
  Map<String, Object?> toJson() => {
        'title': title,
        'content': content,
        'cover': cover,
        'music': music?.toJson(),
        'fontFamily': fontFamily,
      };

  @override
  String toString() =>
      'PoemData(title: $title, content: $content, cover: $cover, music: $music, fontFamily: $fontFamily)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreatePoemData &&
        other.title == title &&
        other.content == content &&
        other.cover == cover &&
        other.music == music &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode => Object.hash(
        title,
        content,
        cover,
        music,
        fontFamily,
      );
}
