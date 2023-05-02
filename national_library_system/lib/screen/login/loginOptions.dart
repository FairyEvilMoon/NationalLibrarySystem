import 'package:flutter/material.dart';
import '../../widgets/ourContainer.dart';
import 'loginStudent.dart';
import 'package:url_launcher/url_launcher.dart';

class OurLoginOptions extends StatelessWidget {
  final Uri _url = Uri.parse('http://172.23.112.1/');

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
              OurContainer(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(_url);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                        child: Text(
                          "Admin Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OurLoginStudent()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                        child: Text(
                          "Student Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
