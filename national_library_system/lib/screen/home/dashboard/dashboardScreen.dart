import 'package:flutter/material.dart';
import 'package:national_library_system/utils/ourTheme.dart';

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
            Container(
              child: Header(headerText, context),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        color: Colors.amber,
                      ),
                      Container(
                        height: 100,
                        color: Colors.green,
                        child: Center(
                            child: Container(
                          child: TextFormField(),
                        )),
                      ),
                    ],
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
