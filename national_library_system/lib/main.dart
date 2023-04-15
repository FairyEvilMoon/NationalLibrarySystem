import 'package:flutter/material.dart';
import 'package:national_library_system/screen/login/loginOptions.dart';
import 'package:national_library_system/utils/ourTheme.dart';
import 'package:national_library_system/states/currentUser.dart';
import 'package:firedart/firedart.dart';

const apiKey = 'AIzaSyAk1PF_sCpmCJCQ0IK9PxzHK6gsIFNUClc';
const projectId = 'nationallibrarysystemevil';
void main() async {
  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: OurLoginOptions(),
    );
  }
}
