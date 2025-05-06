import 'package:flutter/material.dart';

/// {@template error_snackbar}
/// Error snackbar
/// {@endtemplate}
class ErrorSnackbar extends SnackBar {
  /// {@macro error_snackbar}
  ErrorSnackbar({
    required BuildContext context,
    required String message,
    super.key,
    VoidCallback? onDismiss,
  }) : super(
          backgroundColor: Colors.red.withValues(
            alpha: 0.9,
          ),
          elevation: 8,
          shape: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.all(16),
          duration: const Duration(seconds: 5),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onDismiss != null
                  ? GestureDetector(
                      onTap: onDismiss,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
}
