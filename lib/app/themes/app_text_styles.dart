import 'package:flutter/material.dart';
import 'app_dimensions.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _font = 'Cairo';

  static TextStyle xs({Color? color, FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.textXs, fontWeight: weight, color: color);

  static TextStyle sm({Color? color, FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.textSm, fontWeight: weight, color: color);

  static TextStyle base({Color? color, FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.textBase, fontWeight: weight, color: color);

  static TextStyle lg({Color? color, FontWeight weight = FontWeight.w700}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.textLg, fontWeight: weight, color: color);

  static TextStyle xl({Color? color, FontWeight weight = FontWeight.w800}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.textXl, fontWeight: weight, color: color);

  static TextStyle xxl({Color? color, FontWeight weight = FontWeight.w800}) =>
      TextStyle(fontFamily: _font, fontSize: AppDimensions.text2Xl, fontWeight: weight, color: color);

  static TextStyle label({Color? color}) => xs(color: color, weight: FontWeight.w600);
  static TextStyle button({Color? color}) => sm(color: color, weight: FontWeight.w600);
  static TextStyle body({Color? color}) => base(color: color);
  static TextStyle heading({Color? color}) => lg(color: color);
  static TextStyle title({Color? color}) => xl(color: color);

  static TextStyle tabularNum({Color? color, double? size, FontWeight weight = FontWeight.w700}) =>
      TextStyle(
        fontFamily: _font,
        fontSize: size ?? AppDimensions.textBase,
        fontWeight: weight,
        color: color,
        fontFeatures: const [FontFeature.tabularFigures()],
      );
}
