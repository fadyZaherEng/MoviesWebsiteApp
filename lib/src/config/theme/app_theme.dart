import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      useMaterial3: false,
      backgroundColor: ColorSchemes.white,
      fontFamily: getFontFamily(),
      toggleableActiveColor: ColorSchemes.primary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.black38,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchemes.primary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchemes.gray,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.gray,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchemes.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontSize: 18,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color: ColorSchemes.primary,
        ),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightSemiBold,
          color:  ColorSchemes.primary,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightMedium,
          color:  ColorSchemes.primary,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          textDecoration: TextDecoration.none,
          color: ColorSchemes.primary,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.primary,
        ), //Regular
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorSchemes.white,
        elevation: 10,
        selectedIconTheme: IconThemeData(
          color: ColorSchemes.primary,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: ColorSchemes.gray,
          size: 24,
        ),
      ),
      scaffoldBackgroundColor: Colors.black.withOpacity(0.7),
      primaryColor: ColorSchemes.primary,
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.black38,
        elevation: 10,
        width: 250,
        surfaceTintColor: ColorSchemes.primary,
        // scrimColor: ColorSchemes.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),

      ),
      iconTheme:  IconThemeData(color: ColorSchemes.primary, size: 24),
      splashColor: Colors.transparent,
    );
  }

  String getFontFamily() => language == "en"
      ? Constants.englishFontFamily
      : Constants.arabicFontFamily;

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = Constants.englishFontFamily,
    required Color color,
    textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration);
  }
}
