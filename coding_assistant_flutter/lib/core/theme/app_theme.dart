import 'package:coding_assistant_flutter/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  textTheme: AppTextStyles.lightTextTheme,
  // Add other theme properties here
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  textTheme: AppTextStyles.darkTextTheme,
  // Add other theme properties here
);
