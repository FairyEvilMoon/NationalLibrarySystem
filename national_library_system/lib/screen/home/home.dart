import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:national_library_system/screen/home/dashboard/dashboardScreen.dart';
import 'package:national_library_system/screen/home/localwidgets/ourSideMenuBar.dart';
import 'package:national_library_system/screen/home/search/dahboardSearchScreen.dart';
import 'package:national_library_system/screen/home/search/oursearchPage.dart';
import 'package:national_library_system/utils/ourTheme.dart';
import 'package:national_library_system/widgets/ourIconContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: DashboardSearch(
                headerText: "Search",
              ))
        ],
      )),
    );
  }
}
