import 'package:flutter/material.dart';
import 'package:poem/src/core/resources/assets.gen.dart';
import 'package:poem/src/core/widget/ui_icon_button.dart';

/// {@template logo_app_bar}
/// LogoAppBar widget.
/// {@endtemplate}
class LogoAppBar extends StatelessWidget {
  /// {@macro logo_app_bar}
  const LogoAppBar({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: MediaQuery.of(context).padding.top,
      ),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UiIconButton(
              onPressed: () => Navigator.maybePop(
                context,
              ),
              icon: Icon(
                Icons.chevron_left,
              ),
            ),
            Assets.images.logo.image(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
