import 'package:flutter/material.dart';
import 'package:national_library_system/screen/home/home.dart';
import 'package:national_library_system/screen/home/search/oursearchPage.dart';
import 'package:national_library_system/screen/login/loginStudent.dart';
import 'package:national_library_system/utils/ourTheme.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import 'package:national_library_system/widgets/ourIconContainer.dart';

class OurSideMenuBar extends StatelessWidget {
  const OurSideMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OurTheme().seedColor.withOpacity(0.75),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "NATIONAL BOOK SYSTEM",
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        DrawerHeader(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 5)),
          child: Image.asset("assets/logo.png"),
        ),
        Container(
          margin: spacingMargin(),
          child: OurContainer(
            blurRadius: 4.0,
            size: 1,
            child: DrawerListTile(
              title: "Search",
              icon: Icon(
                Icons.search,
                size: 35,
                color: Colors.black,
              ),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OurSearchPage()));
              },
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
                  child: OurContainer(
                    blurRadius: 4.0,
                    size: 1,
                    child: DrawerListTile(
                      title: "Log Out",
                      icon: Icon(
                        Icons.logout,
                        size: 35,
                        color: Colors.black,
                      ),
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OurLoginStudent()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  EdgeInsets spacingMargin() =>
      EdgeInsets.only(left: 16.0, right: 16.0, top: 20);
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      hoverColor: OurTheme().seedColor.withRed(150),
      horizontalTitleGap: 40,
      onTap: press,
      leading: OurIconContainer(child: icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
