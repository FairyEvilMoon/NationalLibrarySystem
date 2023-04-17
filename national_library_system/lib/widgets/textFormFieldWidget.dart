import 'package:flutter/material.dart';
import 'package:national_library_system/utils/ourTheme.dart';

class ourTextFormFieldWidget extends StatelessWidget {
  const ourTextFormFieldWidget(
      {super.key,
      required this.obscureText,
      required this.textController,
      required this.icon,
      required this.hintText});
  final bool obscureText;
  final TextEditingController textController;
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: OurTheme().seedColor)),
      ),
    );
  }
}
