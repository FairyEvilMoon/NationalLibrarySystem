import 'package:flutter/material.dart';
import 'package:national_library_system/screen/home/search/oursearchPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(flex: 5, child: OurSearchPage())],
      )),
    );
  }
}
