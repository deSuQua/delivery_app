import 'dart:ui' show Color;

import 'package:flutter/foundation.dart';

/// Интерфейс цветов
abstract class IAppColors {
  Color get primary;

  Color get primaryS8;
  Color get primaryS7;
  Color get primaryS6;
  Color get primaryS5;
  Color get primaryS4;
  Color get primaryS3;
  Color get primaryS2;
  Color get primaryS1;

  Color get primaryT1;

  Color get secondary;

  Color get secondaryS1;

  Color get secondaryT1;

  Color get success;
  Color get warning;
  Color get info;
  Color get error;

  Color get text4;
  Color get text3;

  Color get gray1;
  Color get gray2;
  Color get gray6;

  Color get white;
  Color get background;
  Color get appBar;
  Color get black;
  Color get appBarTitle;
}

abstract class AppColorsLightBase implements IAppColors {
  @override
  Color get primary => const Color(0xff0560FA);
  @override
  Color get primaryS8 => const Color(0xff006CEC);
  @override
  Color get primaryS7 => const Color(0xff005ECE);
  @override
  Color get primaryS6 => const Color(0xff0051B1);
  @override
  Color get primaryS5 => const Color(0xff004393);
  @override
  Color get primaryS4 => const Color(0xff003676);
  @override
  Color get primaryS3 => const Color(0xff002858);
  @override
  Color get primaryS2 => const Color(0xff001B3B);
  @override
  Color get primaryS1 => const Color(0xff000D1D);

  @override
  Color get primaryT1 => const Color(0xff006CEC);

  @override
  Color get secondary => const Color(0xffEC8000);

  @override
  Color get secondaryS1 => const Color(0xffEC8000);

  @override
  Color get secondaryT1 => const Color(0xffEC8000);

  @override
  Color get success => const Color(0xff35B369);
  @override
  Color get warning => const Color(0xffEBBC2E);
  @override
  Color get info => const Color(0xff2F80ED);
  @override
  Color get error => const Color(0xffED3A3A);

  @override
  Color get text4 => const Color(0xff3A3A3A);
  @override
  Color get text3 => const Color(0xff141414);

  @override
  Color get gray1 => const Color(0xffCFCFCF);
  @override
  Color get gray2 => const Color(0xffA7A7A7);

  @override
  Color get gray6 => const Color(0xffF2F2F2);

  @override
  Color get white => const Color(0xffFFFFFF);

  @override
  Color get background => const Color(0xffFFFFFF);

  @override
  Color get appBar => const Color(0xffFFFFFF);

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get appBarTitle => const Color(0xffA7A7A7);

  const AppColorsLightBase();
}

abstract class AppColorsDarkBase implements IAppColors {
  @override
  Color get primary => const Color(0xff0560FA);
  @override
  Color get primaryS8 => const Color(0xff006CEC);
  @override
  Color get primaryS7 => const Color(0xff005ECE);
  @override
  Color get primaryS6 => const Color(0xff0051B1);
  @override
  Color get primaryS5 => const Color(0xff004393);
  @override
  Color get primaryS4 => const Color(0xff003676);
  @override
  Color get primaryS3 => const Color(0xff002858);
  @override
  Color get primaryS2 => const Color(0xff001B3B);
  @override
  Color get primaryS1 => const Color(0xff000D1D);

  @override
  Color get primaryT1 => const Color(0xff006CEC);

  @override
  Color get secondary => const Color(0xffEC8000);

  @override
  Color get secondaryS1 => const Color(0xffEC8000);

  @override
  Color get secondaryT1 => const Color(0xffEC8000);

  @override
  Color get success => const Color(0xff35B369);
  @override
  Color get warning => const Color(0xffEBBC2E);
  @override
  Color get info => const Color(0xff2F80ED);
  @override
  Color get error => const Color(0xffED3A3A);

  @override
  Color get text4 => const Color(0xff3A3A3A);
  @override
  Color get text3 => const Color(0xff141414);

  @override
  Color get gray1 => const Color(0xffCFCFCF);
  @override
  Color get gray2 => const Color(0xffA7A7A7);
  @override
  Color get gray6 => const Color(0xffF2F2F2);

  @override
  Color get white => const Color(0xffFFFFFF);

  @override
  Color get background => const Color(0xff000D1D);

  @override
  Color get appBar => const Color(0xff001B3B);

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get appBarTitle => const Color(0xffFFFFFF);

  const AppColorsDarkBase();
}

@immutable
mixin _AppColorsDark {}

@immutable
class AppColorsDark = AppColorsDarkBase with _AppColorsDark;

@immutable
mixin _AppColorsLight {}

@immutable
class AppColorsLight = AppColorsLightBase with _AppColorsLight;
