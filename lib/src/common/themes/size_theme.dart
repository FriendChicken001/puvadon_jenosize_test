// Flutter imports:
import 'package:flutter/material.dart';

class SizeTheme {
  SizeTheme._();

  //Single Instance
  static final SizeTheme instance = SizeTheme._();

  //Spacing
  final double _spacingXs = 4.0;
  final double _spacingS = 8.0;
  final double _spacingM = 16.0;
  final double _spacingL = 24.0;
  final double _spacingXl = 32.0;

  // Getters
  double get spacingXs => _spacingXs;
  double get spacingS => _spacingS;
  double get spacingM => _spacingM;
  double get spacingL => _spacingL;
  double get spacingXl => _spacingXl;

  // height
  Widget get spacingXsHeight => SizedBox(height: _spacingXs);
  Widget get spacingSHeight => SizedBox(height: _spacingS);
  Widget get spacingMHeight => SizedBox(height: _spacingM);
  Widget get spacingLHeight => SizedBox(height: _spacingL);
  Widget get spacingXlHeight => SizedBox(height: _spacingXl);

  // width
  Widget get spacingXsWidth => SizedBox(width: _spacingXs);
  Widget get spacingSWidth => SizedBox(width: _spacingS);
  Widget get spacingMWidth => SizedBox(width: _spacingM);
  Widget get spacingLWidth => SizedBox(width: _spacingL);
  Widget get spacingXlWidth => SizedBox(width: _spacingXl);
}
