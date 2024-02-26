import 'package:flutter/material.dart';

@immutable
abstract class IAppTextTheme {
  TextStyle get headingBlack128;

  TextStyle get headingBlack96;

  TextStyle get headingExtraBold64;

  TextStyle get headingExtraBoldExtraBold36;

  TextStyle get headingBold36;

  TextStyle get headingBold24;

  TextStyle get headingMedium24;

  TextStyle get headingSemiBold20;

  TextStyle get headingMedium20;

  TextStyle get subtitleMedium18;

  TextStyle get subtitleBold16;

  TextStyle get subtitleMedium16;

  TextStyle get subtitleRegular16;

  TextStyle get bodyRegular16;

  TextStyle get bodySemiBold14;

  TextStyle get bodyMedium14;

  TextStyle get bodyRegular14;

  TextStyle get bodyMedium12;

  TextStyle get bodyRegular12;
}

@immutable
abstract class AppTextThemeBase implements IAppTextTheme {
  @override
  TextStyle get headingBlack128 => const TextStyle(
        fontWeight: FontWeight.w900,
        fontFamily: 'Roboto',
        fontSize: 128,
        height: 1,
      );

  @override
  TextStyle get headingBlack96 => const TextStyle(
        fontWeight: FontWeight.w900,
        fontFamily: 'Roboto',
        fontSize: 96,
        height: 1,
      );

  @override
  TextStyle get headingExtraBold64 => const TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        fontSize: 64,
        height: 1,
      );

  @override
  TextStyle get headingExtraBoldExtraBold36 => const TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        fontSize: 36,
        height: 1,
      );

  @override
  TextStyle get headingBold36 => const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        fontSize: 36,
        height: 1,
      );

  @override
  TextStyle get headingBold24 => const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        fontSize: 24,
        height: 1,
      );

  @override
  TextStyle get headingMedium24 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 24,
        height: 1,
      );

  @override
  TextStyle get headingSemiBold20 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontSize: 20,
        height: 1,
      );

  @override
  TextStyle get headingMedium20 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 20,
        height: 1,
      );

  @override
  TextStyle get subtitleMedium18 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 18,
        height: 1,
      );

  @override
  TextStyle get subtitleBold16 => const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get subtitleMedium16 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get subtitleRegular16 => const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get bodyRegular16 => const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get bodySemiBold14 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyMedium14 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyRegular14 => const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyMedium12 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 12,
        height: 1,
      );

  @override
  TextStyle get bodyRegular12 => const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: 12,
        height: 1,
      );
}

@immutable
mixin _AppTextTheme {}

@immutable
class AppTextTheme = AppTextThemeBase with _AppTextTheme;
