import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? _position;

  Future<void> setLocationByGPSData() async {
    final position = await Geolocator.getCurrentPosition();

    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your location')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _position == null
              ? 'No location found :('
              :'Lat: ${_position!.latitude}\n Lon: ${_position!.longitude}'
            ),
            ElevatedButton(
              onPressed: setLocationByGPSData,
              child: const Text('Get current location'),
            ),
          ],
        ),
      ),
    );
  }
}
// DEBUG_CHANGE_1766859472
