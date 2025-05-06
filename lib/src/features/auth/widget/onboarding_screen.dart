import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/resources/assets.gen.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/features/auth/widget/title_with_description_widget.dart';

/// {@template onboarding_screen}
/// OnboardingScreen widget.
/// {@endtemplate}
class OnboardingScreen extends StatefulWidget {
  /// {@macro onboarding_screen}
  const OnboardingScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

/// State for widget OnboardingScreen.
class _OnboardingScreenState extends State<OnboardingScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant OnboardingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Assets.images.exam.image(),
                ),
                Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.images.logo.image(),
                    TitleWithDescriptionWidget(
                      title: 'Стихи в ритме вдохновения',
                      description:
                          'Погрузись в атмосферу вдохновения — пиши стихи под звуки фоновой музыки. Делись своими произведениями и находи единомышленников в сообществе поэтов.',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 12,
                      children: [
                        UiButton.primary(
                          onPressed: () => context.octopus.push(
                            Routes.signIn,
                          ),
                          label: const Text(
                            'Войти',
                          ),
                        ),
                        UiButton.secondary(
                          onPressed: () => context.octopus.push(
                            Routes.signUp,
                          ),
                          label: const Text(
                            'Зарегистрироваться',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
