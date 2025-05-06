import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_icon_button.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template sign_in_providers_widget}
/// SignInProvidersWidget widget.
/// {@endtemplate}
class SignInProvidersWidget extends StatelessWidget {
  /// {@macro sign_in_providers_widget}
  const SignInProvidersWidget({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    final color = context.colors.gray500;

    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          spacing: 8,
          children: <Widget>[
            Expanded(
              child: Divider(
                color: color,
              ),
            ),
            UiText.bodyLarge(
              'Или войдите с помощью',
              color: color,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Divider(
                color: color,
              ),
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: context.dependencies.authController.select(
            (state) => state.isProcessing,
          ),
          builder: (context, isProcessing, _) => Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UiIconButton(
                onPressed: () {},
                enabled: !isProcessing,
                icon: Icon(
                  Icons.g_mobiledata,
                ),
              ),
              UiIconButton(
                onPressed: () {},
                enabled: !isProcessing,
                icon: Icon(
                  Icons.apple,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
