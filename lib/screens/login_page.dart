import 'package:flutter/material.dart';
import 'package:piranhaapp/main.dart';
import 'package:piranhaapp/utils/location_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/button.dart';
import '../services/socket_service.dart';
import '../widgets/input_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String HARDCODED_USERNAME = "admin";

  final String HARDCODED_PASSWORD = "admin";

  late IO.Socket socket;

  String username = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
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
                  manageLogin(username == HARDCODED_USERNAME &&
                      password == HARDCODED_PASSWORD);
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

  void manageLogin(bool isUserExists) async {
    if (isUserExists) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', username);
      initSocket();
      fetchLocation();
    }

    // showDialog<String>(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: isUserExists
    //         ? const Text('Connected')
    //         : const Text('Not Connected'),
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: () => Navigator.pop(context, 'OK'),
    //         child: Text(
    //           'OK',
    //           style: TextStyle(color: Theme.of(context).primaryColor),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  void initSocket() {
    final SocketService socketService = injector.get<SocketService>();
    socketService.createSocketConnection((data) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(data.toString()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ));
    });
  }
}
