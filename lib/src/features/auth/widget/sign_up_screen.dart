import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/features/auth/controller/sign_up_controller.dart';
import 'package:poem/src/features/auth/widget/focusable_text_button.dart';
import 'package:poem/src/features/auth/widget/logo_app_bar.dart';
import 'package:poem/src/features/auth/widget/sign_up_form.dart';
import 'package:poem/src/features/auth/widget/title_with_description_widget.dart';

/// {@template sign_up_screen}
/// A widget which is responsible for the sign up screen.
/// {@endtemplate}
class SignUpScreen extends StatefulWidget {
  /// {@macro sign_up_screen}
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with _SignUpScreenStateMixin {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _controller.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, child) {
          final canPop = !isProcessing;

          return PopScope(
            canPop: canPop,
            child: child!,
          );
        },
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
                            title: 'Зарегистрируйтесь',
                            description: 'Введите свои данные',
                          ),
                          SignUpForm(
                            controller: _controller,
                          ),
                          Spacer(),
                          ValueListenableBuilder(
                            valueListenable: _controller.select(
                              (state) => state.isProcessing,
                            ),
                            builder: (context, isProcessing, _) =>
                                FocusableTextButton(
                              enabled: !isProcessing,
                              onPressed: () => context.octopus.push(
                                Routes.signIn,
                              ),
                              labelText: 'Уже есть аккаунт? ',
                              buttonText: 'Войти',
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

mixin _SignUpScreenStateMixin on State<SignUpScreen> {
  late final SignUpController _controller;

  @override
  void initState() {
    super.initState();

    _controller = SignUpController(
      repository: context.dependencies.authRepository,
      initialState: const SignUpState.idle(
        error: null,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
