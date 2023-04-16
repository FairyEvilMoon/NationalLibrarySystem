import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../../utils/ourTheme.dart';
import '../dashboard/dashboardScreen.dart';
import '../localwidgets/ourSideMenuBar.dart';

class OurLibraryPage extends StatelessWidget {
  const OurLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: OurTheme().seedColor.withOpacity(0.8),
              child: OurSideMenuBar(),
            ),
          ),
          Expanded(
              flex: 5,
              child: DashboardScreen(
                headerText: "My Library",
              ))
        ],
      )),
    );
  }
}
