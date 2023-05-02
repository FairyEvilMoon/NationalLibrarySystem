import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:national_library_system/providers/book_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/ourTheme.dart';
import '../dashboard/dashboardScreen.dart';
import '../localwidgets/ourSideMenuBar.dart';
import 'dahboardSearchScreen.dart';

class OurSearchPage extends StatelessWidget {
  const OurSearchPage({super.key});
  static const routeName = '/search-screen';
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
              child: ChangeNotifierProvider(
                create: (context) => BookProvider(),
                child: DashboardSearch(
                  headerText: "Search",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
