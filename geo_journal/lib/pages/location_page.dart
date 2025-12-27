import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? _position;
  String? _error;

  Future<void> setLocationByGPSData() async {
  setState(() {
    _error = null;
  });

  try {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _error = 'Location services are disabled...';
      });
      return;
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      setState(() {
        _error = 'Permission denied...';
      });
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _error = 'Permission denied...';
      });
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    setState(() {
      _position = position;
    });
  } catch (e) {
    setState(() {
      _error = e.toString();
    });
  }
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
              _error != null ? 'Error: $_error'
              : _position == null
                  ? 'No location found :('
                  : 'Lat: ${_position!.latitude}\n Lon: ${_position!.longitude}',
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