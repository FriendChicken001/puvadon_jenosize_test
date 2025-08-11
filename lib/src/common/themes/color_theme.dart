// Flutter imports:
import 'package:flutter/material.dart';

class ColorsTheme {
  ColorsTheme._();

  // Singleton
  static final ColorsTheme instance = ColorsTheme._();

  // Primary colors
  final Color _primary = const Color.fromRGBO(64, 143, 222, 1);
  final Color _primary80p = const Color.fromRGBO(103, 165, 228, 1);
  final Color _primary60p = const Color.fromRGBO(142, 187, 234, 1);
  final Color _primary40p = const Color.fromRGBO(179, 210, 241, 1);
  final Color _primary20p = const Color.fromRGBO(217, 231, 249, 1);

  // Secondary colors
  final Color _secondary = const Color.fromRGBO(255, 153, 0, 1);
  final Color _secondary80p = const Color.fromRGBO(255, 179, 102, 1);
  final Color _secondary60p = const Color.fromRGBO(255, 204, 153, 1);
  final Color _secondary40p = const Color.fromRGBO(255, 229, 204, 1);
  final Color _secondary20p = const Color.fromRGBO(255, 242, 229, 1);

  // Natural colors
  final Color _natural = const Color.fromRGBO(63, 68, 68, 1);
  final Color _natural80p = const Color.fromRGBO(100, 105, 105, 1);
  final Color _natural60p = const Color.fromRGBO(138, 142, 142, 1);
  final Color _natural40p = const Color.fromRGBO(179, 180, 180, 1);
  final Color _natural20p = const Color.fromRGBO(216, 217, 217, 1);
  final Color _naturalDisabled = const Color.fromRGBO(234, 234, 234, 1);
  final Color _naturalShadowNavBar = const Color.fromRGBO(74, 134, 193, 0.3);

  // Green colors
  final Color _green = const Color.fromRGBO(76, 175, 80, 1);
  final Color _green80p = const Color.fromRGBO(102, 187, 106, 1);
  final Color _green60p = const Color.fromRGBO(129, 199, 132, 1);
  final Color _green40p = const Color.fromRGBO(156, 221, 157, 1);
  final Color _green20p = const Color.fromRGBO(183, 242, 182, 1);

  // White color
  final Color _white = const Color.fromRGBO(255, 255, 255, 1);
  final Color _whiteBackground = const Color.fromRGBO(250, 252, 255, 1);

  // transparent
  final Color _transparent = Colors.transparent;

  //black
  final Color _black = const Color.fromRGBO(0, 0, 0, 1);

  // Getters
  Color get primary => _primary;
  Color get primary80p => _primary80p;
  Color get primary60p => _primary60p;
  Color get primary40p => _primary40p;
  Color get primary20p => _primary20p;

  Color get secondary => _secondary;
  Color get secondary80p => _secondary80p;
  Color get secondary60p => _secondary60p;
  Color get secondary40p => _secondary40p;
  Color get secondary20p => _secondary20p;

  Color get green => _green;
  Color get green80p => _green80p;
  Color get green60p => _green60p;
  Color get green40p => _green40p;
  Color get green20p => _green20p;

  Color get natural => _natural;
  Color get natural80p => _natural80p;
  Color get natural60p => _natural60p;
  Color get natural40p => _natural40p;
  Color get natural20p => _natural20p;
  Color get naturalDisabled => _naturalDisabled;
  Color get naturalShadowNavBar => _naturalShadowNavBar;

  Color get white => _white;
  Color get whiteBackground => _whiteBackground;

  Color get transparent => _transparent;

  Color get black => _black;
}
