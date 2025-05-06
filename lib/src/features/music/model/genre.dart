/// {@template genre}
/// Genre of music
/// {@endtemplate}
class Genre {
  /// {@macro genre}
  const Genre({
    required this.displayName,
    required this.id,
  });

  /// The name of the genre.
  final String displayName;

  /// The unique identifier for the genre.
  final int id;

  /// Creates a copy of the current genre with the given parameters.
  Genre copyWith({
    String? displayName,
    int? id,
  }) =>
      Genre(
        displayName: displayName ?? this.displayName,
        id: id ?? this.id,
      );

  /// Converts a JSON map into a [Genre] instance.
  factory Genre.fromJson(Map<String, Object?> json) => Genre(
        displayName: json['title'] as String,
        id: json['id'] as int,
      );

  /// Converts this [Genre] instance into a JSON map.
  Map<String, Object?> toJson() => {
        'title': displayName,
        'id': id,
      };

  /// Converts this [Genre] instance into a string representation.
  @override
  String toString() => 'Genre(displayName: $displayName, id: $id)';

  /// Compares this [Genre] instance with another [Genre] instance.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre && displayName == other.displayName && id == other.id;

  /// Generates a hash code for this [Genre] instance.
  @override
  int get hashCode => Object.hash(displayName, id);
}
