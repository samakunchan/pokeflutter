import 'package:flutter/material.dart';

/// Identity
const Color kPrimaryColor = Color(0xFFDC0A2D);

/// Type
const Color kBugColor = Color(0xFFA7B723);
const Color kTypeDarkColor = Color(0xFF75574C);
const Color kDragonColor = Color(0xFF7037FF);
const Color kElectricColor = Color(0xFFF9CF30);
const Color kFairyColor = Color(0xFFE69EAC);
const Color kFightingColor = Color(0xFFC12239);
const Color kFireColor = Color(0xFFF57D31);
const Color kFlyingColor = Color(0xFFA891EC);
const Color kGhostColor = Color(0xFF70559B);
const Color kNormalColor = Color(0xFFAAA67F);
const Color kGrassColor = Color(0xFF74CB48);
const Color kGroundColor = Color(0xFFDEC16B);
const Color kIceColor = Color(0xFF9AD6DF);
const Color kPoisonColor = Color(0xFFA43E9E);
const Color kPsychicColor = Color(0xFFFB5584);
const Color kRockColor = Color(0xFFB69E31);
const Color kSteelColor = Color(0xFFB7B9D0);
const Color kWaterColor = Color(0xFF6493EB);

/// Grayscale
const Color kDarkColor = Color(0xFF212121);
const Color kMediumColor = Color(0xFF666666);
const Color kLightColor = Color(0xFFE0E0E0);
const Color kBackgroundColor = Color(0xFFEFEFEF);
const Color kWhiteColor = Color(0xFFFFFFFF);

/// [String] type - should be in uppercase
/// ```
/// Example:
///     getType('Dragon') // OK
///     getType('dragon') // Not OK
/// ```
Color getType(String type) {
  switch (type) {
    case 'Bug':
      return kBugColor;
    case 'TypeDark':
      return kTypeDarkColor;
    case 'Dragon':
      return kDragonColor;
    case 'Electric':
      return kElectricColor;
    case 'Fairy':
      return kFairyColor;
    case 'Fighting':
      return kFightingColor;
    case 'Fire':
      return kFireColor;
    case 'Flying':
      return kFlyingColor;
    case 'Ghost':
      return kGhostColor;
    case 'Normal':
      return kNormalColor;
    case 'Grass':
      return kGrassColor;
    case 'Ground':
      return kGroundColor;
    case 'Ice':
      return kIceColor;
    case 'Poison':
      return kPoisonColor;
    case 'Psychic':
      return kPsychicColor;
    case 'Rock':
      return kRockColor;
    case 'Steel':
      return kSteelColor;
    case 'Water':
      return kWaterColor;
    default:
      return kPrimaryColor;
  }
}
