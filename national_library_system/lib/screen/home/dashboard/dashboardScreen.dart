import 'package:flutter/material.dart';
import 'package:national_library_system/utils/ourTheme.dart';
import 'package:national_library_system/widgets/ourContainer.dart';

import '../localwidgets/componentHeader.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            OurContainer(
              child: Header(headerText, context),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
