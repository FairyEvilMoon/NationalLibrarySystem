import 'package:flutter/material.dart';
import 'package:national_library_system/screen/login/localwidgets/loginFormAdmin.dart';

class OurLoginAdmin extends StatelessWidget {
  const OurLoginAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OurLoginFormAdmin(),
              BackButton()
            ],
          )
        ],
      ),
    );
  }
}
