import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template create_poem_settings_bottom_modal_sheet}
/// CreatePoemSettingsBottomModalSheet widget.
/// {@endtemplate}
class CreatePoemSettingsBottomModalSheet extends StatelessWidget {
  /// {@macro create_poem_settings_bottom_modal_sheet}
  const CreatePoemSettingsBottomModalSheet({
    this.onPressChangeFontFamily,
    this.onPressChangeMusic,
    this.onPressChangeCover,
    this.onPressCheckPoem,
    super.key, // ignore: unused_element
  });

  /// Callback when the user presses the change font family button.
  final VoidCallback? onPressChangeFontFamily;

  /// Callback when the user presses the change music button.
  final VoidCallback? onPressChangeMusic;

  /// Callback when the user presses the change cover button.
  final VoidCallback? onPressChangeCover;

  /// Callback when the user presses the check poem button.
  final VoidCallback? onPressCheckPoem;

  /// Show the modal bottom sheet to select a font.
  /// Returns the selected font family.
  static Future<String?> show(
    BuildContext context, {
    VoidCallback? onPressChangeFontFamily,
    VoidCallback? onPressChangeMusic,
    VoidCallback? onPressChangeCover,
    VoidCallback? onPressCheckPoem,
  }) =>
      showModalBottomSheet<String?>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => CreatePoemSettingsBottomModalSheet(
          onPressChangeFontFamily: onPressChangeFontFamily,
          onPressChangeMusic: onPressChangeMusic,
          onPressChangeCover: onPressChangeCover,
          onPressCheckPoem: onPressCheckPoem,
        ),
      );

  /* #endregion */
  @override
  Widget build(BuildContext context) => Ink(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              12.0,
            ),
          ),
        ),
        child: Column(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UiText.bodyLarge(
              'Poem Settings',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    spacing: 8.0,
                    children: [
                      Expanded(
                        child: UiButton.secondary(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onPressChangeMusic?.call();
                          },
                          label: const Text(
                            'Select Music',
                          ),
                        ),
                      ),
                      Expanded(
                        child: UiButton.secondary(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onPressChangeCover?.call();
                          },
                          label: const Text(
                            'Select Cover',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8.0,
                    children: [
                      Expanded(
                        child: UiButton.secondary(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onPressChangeFontFamily?.call();
                          },
                          label: const Text(
                            'Change Font',
                          ),
                        ),
                      ),
                      Expanded(
                        child: UiButton.primary(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onPressCheckPoem?.call();
                          },
                          label: const Text(
                            'Auto Edit punctuation',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
