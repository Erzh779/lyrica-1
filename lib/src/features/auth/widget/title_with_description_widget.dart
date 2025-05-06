import 'package:flutter/widgets.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template title_with_description_widget}
/// TitleWithDescriptionWidget widget.
/// {@endtemplate}
class TitleWithDescriptionWidget extends StatelessWidget {
  /// {@macro title_with_description_widget}
  const TitleWithDescriptionWidget({
    required this.title,
    required this.description,
    super.key, // ignore: unused_element
  });

  /// Title of the widget.
  final String title;

  /// Description of the widget.
  final String description;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          UiText.headlineSmall(
            title,
            textAlign: TextAlign.start,
          ),
          UiText.bodyMedium(
            description,
            textAlign: TextAlign.start,
            color: context.colors.gray700,
          ),
        ],
      );
}
