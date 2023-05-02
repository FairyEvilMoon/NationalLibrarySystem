import 'package:flutter/material.dart';
import 'package:national_library_system/providers/appwrite_provider.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import '../../../widgets/textFormFieldWidget.dart';

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
            child: ourTextFormFieldWidget(
              textController: _fullNameController,
              icon: Icons.person_outline,
              hintText: "Full Name",
              obscureText: false,
            ),
          ),
          SizedBox(
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
          SizedBox(
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
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 250,
            child: ourTextFormFieldWidget(
              textController: _confirmPasswordController,
              icon: Icons.lock_outline,
              hintText: "Confirm Password",
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_passwordController.text == _confirmPasswordController.text) {
                await AppWriteProvider().signUp(_emailController.text,
                    _passwordController.text, _fullNameController.text);
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
