import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';

class TextsTheme {
  const TextsTheme._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 =>
      _poppinsTextTheme.headline6.copyWith(
        fontSize: AppSizes.size_20.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadline5 =>
      _poppinsTextTheme.headline5.copyWith(
        fontSize: AppSizes.size_24.sp,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
    color: Colors.white,
    fontSize: AppSizes.size_16.sp
  );

  static TextStyle get _whiteButton => _poppinsTextTheme.button.copyWith(
      color: Colors.white,
      fontSize: AppSizes.size_14.sp
  );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2.copyWith(
    color: Colors.white,
    fontSize: AppSizes.size_14.sp,
    letterSpacing: 0.25,
    wordSpacing: 0.25,
    height: 1.5
  );

  static getTextTheme() => TextTheme(
    headline5: _whiteHeadline5,
    headline6: _whiteHeadline6,
    subtitle1: whiteSubtitle1,
    bodyText2: whiteBodyText2,
    button: _whiteButton
  );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
    color: ColorsTheme.royalBlue,
    fontWeight: FontWeight.w600
  );
}
