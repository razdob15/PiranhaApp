// import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

getUserID() async {
  print('get');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('get');
  String myString = prefs.getString('userId') ?? '';
  print(myString);
  return myString;
}

changeUserID(username) async {
  print('set');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', username);
}
