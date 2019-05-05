import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'dart:math';

class GeoLocationServices {
  static GeoLocationServices instance = GeoLocationServices();

  LocationData currentLocation;

  var location = new Location();

  Future<Map> getLocation() async {
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
      return null;
    }
    return {
      'latitude': currentLocation.latitude,
      'longitude': currentLocation.longitude,
    };
  }

  double getDistance(double lat1, double lon1, double lat2, double lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (pi / 180);
  }
}
