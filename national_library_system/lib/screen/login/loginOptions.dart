import 'package:flutter/material.dart';
import '../../widgets/ourContainer.dart';
import 'loginAdmin.dart';
import 'loginStudent.dart';

class OurLoginOptions extends StatelessWidget {
  const OurLoginOptions({super.key});

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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OurLoginAdmin()));
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
