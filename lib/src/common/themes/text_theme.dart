// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/assets/fonts.gen.dart';
import 'color_theme.dart';

class TextThemeCustom {
  TextThemeCustom._();
  static TextThemeCustom? _instance;

  // lazy singleton
  static TextThemeCustom get instance => _instance ??= TextThemeCustom._();

  //font family
  static const String _fontOutfit = FontFamily.outfit;

  //font size
  static const double _fortyEight = 48.0;
  static const double _thirtyTwo = 32.0;
  static const double _twentyFour = 24.0;
  static const double _twenty = 20.0;
  static const double _eighteen = 18.0;
  static const double _sixteen = 16.0;
  static const double _fourteen = 14.0;

  void reset() {
    _instance = null;
  }

  static String _getFontFamily() {
    return _fontOutfit;
  }

  static double _getFontSize({required double size}) {
    return size;
  }

  final TextStyle _heading1 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _fortyEight),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _heading2 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _thirtyTwo),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _heading3 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _twentyFour),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _heading4 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _eighteen),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _subTitle2 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _twenty),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _subTitle3 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _eighteen),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _paragraph1 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _eighteen),
    fontWeight: FontWeight.w400,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _paragraph3 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _sixteen),
    fontWeight: FontWeight.w400,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _paragraph4 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _fourteen),
    fontWeight: FontWeight.w400,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
  );

  final TextStyle _button1 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _twenty),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  final TextStyle _button2 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _sixteen),
    fontWeight: FontWeight.w700,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
  );

  final TextStyle _button3 = TextStyle(
    fontFamily: _getFontFamily(),
    fontSize: _getFontSize(size: _sixteen),
    fontWeight: FontWeight.w400,
    color: ColorsTheme.instance.natural,
    overflow: TextOverflow.ellipsis,
    height: 1,
  );

  TextStyle get heading1 => _heading1;
  TextStyle get heading2 => _heading2;
  TextStyle get heading3 => _heading3;
  TextStyle get heading4 => _heading4;
  TextStyle get paragraph1 => _paragraph1;
  TextStyle get paragraph3 => _paragraph3;
  TextStyle get paragraph4 => _paragraph4;
  TextStyle get subTitle2 => _subTitle2;
  TextStyle get subTitle3 => _subTitle3;
  TextStyle get button1 => _button1;
  TextStyle get button2 => _button2;
  TextStyle get button3 => _button3;

  String get fontOutfit => _fontOutfit;
}
