import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/colors.dart';
import 'package:pokeflutter/utils/text_styles.dart';

const String svgPath = 'assets/svgs_1';
const String pngPath = 'assets/pngs';

/// Exemple
/// ```
/// 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{YOUR_ID_POKEMON}.png'
/// ```
const String officialArtwork =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';
const double kDefaultRadius = 30;
const double kCardRadius = 10;

final OutlineInputBorder kShape = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor),
  borderRadius: BorderRadius.circular(kDefaultRadius),
);

final OutlineInputBorder kShapeCard = OutlineInputBorder(
  borderSide: BorderSide(color: kBackgroundColor),
  borderRadius: BorderRadius.circular(kCardRadius),
);

ShapeDecoration cardDecoration() {
  return ShapeDecoration(shape: kShapeCard, color: kBackgroundColor);
}

ShapeDecoration appDecoration({double radius = kDefaultRadius, Color color = kPrimaryColor}) {
  return ShapeDecoration(
    shape: kShape.copyWith(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    ),
    shadows: [
      BoxShadow(
        color: kDarkColor.withValues(alpha: .6),
        spreadRadius: -5.0,
      ),
      BoxShadow(
        color: kWhiteColor,
        spreadRadius: -6.0,
        blurRadius: 2.0,
      ),
    ],
  );
}

final ThemeData kThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme: TextTheme(bodyMedium: kBody2),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: kPrimaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(kDefaultRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(kDefaultRadius),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(kPrimaryColor),
      iconSize: WidgetStatePropertyAll(20),
      fixedSize: WidgetStatePropertyAll(Size(50, 50)),
      backgroundColor: WidgetStatePropertyAll(kWhiteColor),
      shape: WidgetStatePropertyAll(
        CircleBorder(
          side: BorderSide(
            color: kDarkColor.withValues(alpha: .6),
            width: 1.0,
          ),
        ),
      ),
      elevation: WidgetStatePropertyAll(0),
      shadowColor: WidgetStatePropertyAll(kDarkColor),
    ),
  ),
  cardTheme: CardThemeData(color: kWhiteColor),
  dialogTheme: DialogThemeData(
    shape: kShapeCard.copyWith(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: kPrimaryColor,
    contentTextStyle: kBody3,
    insetPadding: EdgeInsets.all(100),
  ),
);
