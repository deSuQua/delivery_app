import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  TextStyle get headingBlack128 => GoogleFonts.roboto(
        fontWeight: FontWeight.w900,
        fontSize: 128,
        height: 1,
      );

  @override
  TextStyle get headingBlack96 => GoogleFonts.roboto(
        fontWeight: FontWeight.w900,
        fontSize: 96,
        height: 1,
      );

  @override
  TextStyle get headingExtraBold64 => GoogleFonts.roboto(
        fontWeight: FontWeight.w800,
        fontSize: 64,
        height: 1,
      );

  @override
  TextStyle get headingExtraBoldExtraBold36 => GoogleFonts.roboto(
        fontWeight: FontWeight.w800,
        fontSize: 36,
        height: 1,
      );

  @override
  TextStyle get headingBold36 => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 36,
        height: 1,
      );

  @override
  TextStyle get headingBold24 => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1,
      );

  @override
  TextStyle get headingMedium24 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: 1,
      );

  @override
  TextStyle get headingSemiBold20 => GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1,
      );

  @override
  TextStyle get headingMedium20 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 1,
      );

  @override
  TextStyle get subtitleMedium18 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1,
      );

  @override
  TextStyle get subtitleBold16 => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get subtitleMedium16 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get subtitleRegular16 => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get bodyRegular16 => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1,
      );

  @override
  TextStyle get bodySemiBold14 => GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyMedium14 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyRegular14 => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1,
      );

  @override
  TextStyle get bodyMedium12 => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1,
      );

  @override
  TextStyle get bodyRegular12 => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1,
      );
}

@immutable
mixin _AppTextTheme {}

@immutable
class AppTextTheme = AppTextThemeBase with _AppTextTheme;
