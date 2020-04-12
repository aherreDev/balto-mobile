import 'package:flutter/material.dart';

final _icons = {
  "empeorando": Icons.sentiment_very_dissatisfied,
  "estable": Icons.sentiment_neutral,
  "mejorando": Icons.sentiment_satisfied
};
IconData getIconsData(String iconName) {
  return _icons[iconName];
}
