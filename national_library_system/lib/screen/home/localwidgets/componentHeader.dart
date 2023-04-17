import 'package:flutter/material.dart';
import 'package:national_library_system/widgets/ourIconContainer.dart';

import '../../../utils/ourTheme.dart';

Row Header(String headerText, BuildContext context) {
  return Row(
    children: [
      Text(
        headerText,
        style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
      ),
      Spacer(),
      ProfileCard()
    ],
  );
}

Container ProfileCard() {
  return Container(
    decoration: BoxDecoration(
        color: OurTheme().seedColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 0.1,
              offset: Offset(4.0, 4.0)),
        ],
        border: Border.all(color: Colors.white10)),
    margin: EdgeInsets.only(left: 16.0),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
    child: Row(
      children: [
        OurIconContainer(child: Icon(Icons.person)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Account",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
        ),
        Icon(Icons.keyboard_arrow_down)
      ],
    ),
  );
}
