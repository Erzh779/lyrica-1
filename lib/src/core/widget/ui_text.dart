import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/resources/app_typography.dart';

/// {@template ui_text}
/// UiText widget to handle different text styles and sizes
/// {@endtemplate}
class UiText extends StatelessWidget {
  const UiText._(
    this.content, {
    this.color,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    TextStyle? Function(AppTypography)? styleBuilder,
  }) : _styleBuilder = styleBuilder;

  /// Display Large
  factory UiText.displayLarge(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.displayLarge,
      );

  /// Display Medium
  factory UiText.displayMedium(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.displayMedium,
      );

  /// Display Small
  factory UiText.displaySmall(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.displaySmall,
      );

  /// Headline Large
  factory UiText.headlineLarge(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.headlineLarge,
      );

  /// Headline Medium
  factory UiText.headlineMedium(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.headlineMedium,
      );

  /// Headline Small
  factory UiText.headlineSmall(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.headlineSmall,
      );

  /// Title Large
  factory UiText.titleLarge(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.titleLarge,
      );

  /// Title Medium
  factory UiText.titleMedium(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.titleMedium,
      );

  /// Title Small
  factory UiText.titleSmall(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.titleSmall,
      );

  /// Label Large
  factory UiText.labelLarge(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.labelLarge,
      );

  /// Label Medium
  factory UiText.labelMedium(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.labelMedium,
      );

  /// Label Small
  factory UiText.labelSmall(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.labelSmall,
      );

  /// Body Large
  factory UiText.bodyLarge(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodyLarge,
      );

  /// Body Medium
  factory UiText.bodyMedium(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodyMedium,
      );

  /// Body Small
  factory UiText.bodySmall(
    String content, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodySmall,
      );

  /// Content of the text
  final String content;

  /// Text alignment
  final TextAlign? textAlign;

  /// Text overflow
  final TextOverflow? overflow;

  /// Whether to allow text to wrap onto the next line
  /// (if false, the text will be truncated with an ellipsis if it doesn't fit)
  final bool? softWrap;

  /// Maximum number of lines to display
  final int? maxLines;

  /// Color of the text
  final Color? color;

  final TextStyle? Function(AppTypography)? _styleBuilder;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    final style = _styleBuilder?.call(typography) ?? typography.titleSmall;

    return Text(
      content,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      style: style.copyWith(
        color: color,
      ),
    );
  }
}
