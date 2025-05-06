import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/localization/localization.dart';
import 'package:poem/src/core/resources/app_theme.dart';
import 'package:poem/src/core/router/router_state_mixin.dart';
import 'package:poem/src/features/auth/widget/auth_scope.dart';

/// {@template material_context}
/// A widget which creates a material context.
/// {@endtemplate}
class MaterialContext extends StatefulWidget {
  /// {@macro material_context}
  const MaterialContext({
    super.key,
  });

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext>
    with RouterStateMixin {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: router.config,
        localizationsDelegates: [
          ...Localization.localizationDelegates,
          FlutterQuillLocalizations.delegate,
        ],
        theme: AppTheme.light,
        supportedLocales: Localization.supportedLocales,
        builder: (context, child) => OctopusTools(
          octopus: router,
          child: AuthScope(
            child: child ?? SizedBox(),
          ),
        ),
      );
}
