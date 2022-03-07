import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String HARDCODED_USERNAME = "admin";

  final String HARDCODED_PASSWORD = "admin";

  String username = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpeg'),
            Column(
              children: [
                GeneralInput(
                  onChange: (input) {
                    username = input;
                  },
                  labelText: "Enter Username",
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                GeneralInput(
                  onChange: (input) {
                    password = input;
                  },
                  labelText: "Enter Password",
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                Button(() {
                  bool isUserExists = username == HARDCODED_USERNAME &&
                      password == HARDCODED_PASSWORD;
                  manageLogin(isUserExists);
                }, "Log In"),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                const Text(
                  "Not yet Registered? Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                Button(() => {}, "Sign Up")
              ],
            )
          ],
        ),
      )),
    );
  }

  void manageLogin(bool isUserExists) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: isUserExists ? const Text('Connected') : const Text('Not Connected'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text(
              'OK',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
