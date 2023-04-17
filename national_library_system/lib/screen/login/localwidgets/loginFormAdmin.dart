import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:national_library_system/screen/adminHome/homeAdmin.dart';
import 'package:national_library_system/states/currentUser.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import 'package:national_library_system/utils/ourTheme.dart';

import '../../../widgets/textFormFieldWidget.dart';

class OurLoginFormAdmin extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<bool> _loginUser(
      String email, String password, BuildContext context) async {
    bool retVal = false;
    try {
      if (await CurrentUser().signInWithEmailAndPassword(email, password)) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomeAdminScreen()));
        retVal = true;
        _emailController..clear();
        _passwordController.clear();
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Log In",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: ourTextFormFieldWidget(
              textController: _emailController,
              icon: Icons.alternate_email,
              hintText: "Email",
              obscureText: false,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: ourTextFormFieldWidget(
              textController: _passwordController,
              icon: Icons.lock_outline,
              hintText: "Password",
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              if (!(await _loginUser(
                  _emailController.text, _passwordController.text, context))) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Incorrect Credentials"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("ok"))
                    ],
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: Text(
                "Log In",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
