import 'dart:convert';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:piranhaapp/main.dart';
import 'package:piranhaapp/services/socket_service.dart';
import 'package:piranhaapp/utils/user_util.dart';

void fetchLocation() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  await location.enableBackgroundMode(enable: true);
  await location.changeSettings(interval: 10000);

  location.onLocationChanged.listen((LocationData currentLocation) {
    print("##########");
    print("##########");

    sendLocationToServer(currentLocation, DateTime.now());
  });
}

void sendLocationToServer(
    LocationData currentLocation, DateTime currentTime) async {
  const locationServerAddress = '20.93.144.32:5000';
  const locationPath = '/location';

   String userId = await getUserID();

  await http.post(Uri.parse('http://${locationServerAddress + locationPath}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
        'userId': userId,
        'time': currentTime.toLocal().toString()
      }));
}
