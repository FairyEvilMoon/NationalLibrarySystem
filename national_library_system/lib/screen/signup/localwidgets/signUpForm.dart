import 'package:flutter/material.dart';
import 'package:national_library_system/states/currentUser.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import 'package:provider/provider.dart';

class OurSignUpForm extends StatefulWidget {
  const OurSignUpForm({super.key});

  @override
  State<OurSignUpForm> createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  final bool _isLogin = false;
  bool _loading = false;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined),
                  hintText: "Full Name"),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  hintText: "Confirm Password"),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_passwordController.text == _confirmPasswordController.text) {
                await CurrentUser().registerWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                Navigator.pop(context);
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Password doesen\'t match"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("ok"))
                    ],
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
