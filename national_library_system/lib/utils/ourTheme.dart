import 'package:flutter/material.dart';

class OurTheme {
  ThemeData buildTheme() {
    Color seedColor = Color.fromRGBO(255, 0, 0, 1);
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return seedColor.withOpacity(
                    0.5); // Default color for disabled state, or provide a custom color.
              }
              return seedColor; // Color for enabled state.
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return seedColor.withOpacity(
                    0); // Default color for disabled state, or provide a custom color.
              }
              return seedColor; // Color for enabled state.
            },
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: seedColor)),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return seedColor.withOpacity(
                    0); // Default color for disabled state, or provide a custom color.
              }
              return seedColor; // Color for enabled state.
            },
          ),
        ),
      ),
    );
  }
}
