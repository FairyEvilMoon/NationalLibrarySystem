import 'package:flutter/material.dart';

class OurTheme {
  Color seedColor = Color.fromRGBO(190, 22, 22, 1);
  ThemeData buildTheme() {
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
        scaffoldBackgroundColor: Colors.white,
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(0),
        ));
  }
}
