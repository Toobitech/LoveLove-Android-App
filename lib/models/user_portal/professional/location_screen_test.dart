import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationTest extends StatefulWidget {
  const LocationTest({super.key});

  @override
  State<LocationTest> createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest> {
  final Location location = Location();
  LocationData? _location;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location services are enabled.
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check for location permissions; request them if not already granted.
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Finally, get the location.
    _location = await location.getLocation();
    setState(() {
      print('Lat: ${_location!.latitude}, Long: ${_location!.longitude}');
    }); // Update the UI with the location data.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location Example'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Location:'),
              if (_location != null)
                Text(
                    'Lat: ${_location!.latitude}, Long: ${_location!.longitude}'),
              ElevatedButton(
                onPressed: _getLocation,
                child: Text('Get Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
