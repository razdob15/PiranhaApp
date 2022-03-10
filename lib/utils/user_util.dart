import 'package:localstorage/localstorage.dart';

getUserID() {
  final LocalStorage storage = LocalStorage('PiranhaApp');
  return storage.getItem('userId');
}

changeUserID(username) {
  final LocalStorage storage = LocalStorage('PiranhaApp');
  // print(storage.getItem('userId'));
  storage.setItem('userId', username);
}
