import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/features/auth/widget/focusable_text_button.dart';
import 'package:poem/src/features/auth/widget/logo_app_bar.dart';
import 'package:poem/src/features/auth/widget/sign_in_form.dart';
import 'package:poem/src/features/auth/widget/title_with_description_widget.dart';

/// {@template sign_in_screen}
/// A widget which represents the sign in screen.
/// {@endtemplate}
class SignInScreen extends StatelessWidget {
  /// {@macro sign_in_screen}
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: context.dependencies.authController.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, child) => PopScope(
          canPop: !isProcessing,
          child: child!,
        ),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: LogoAppBar(),
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Column(
                        spacing: 32,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Spacer(),
                          TitleWithDescriptionWidget(
                            title: 'Войдите',
                            description:
                                'Войдите, чтобы пользоваться приложением',
                          ),
                          SignInForm(),
                          // TODO: enable this when the sign in providers are ready
                          // SignInProvidersWidget(),
                          Spacer(),
                          ValueListenableBuilder(
                            valueListenable:
                                context.dependencies.authController.select(
                              (state) => state.isProcessing,
                            ),
                            builder: (context, isProcessing, child) =>
                                FocusableTextButton(
                              onPressed: () => context.octopus.push(
                                Routes.signUp,
                              ),
                              enabled: !isProcessing,
                              labelText:
                                  'У вас нет аккаунта? ', // TODO: Localize
                              buttonText: 'Зарегистрируйтесь', // TODO: Localize
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
