import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class VetLocationViewModel extends ChangeNotifier{
  LocationData? current_Location;
  List<Marker> locationMarkers = [];
  List<LatLng> polylinesPoints = [];



  init() {
    pointMarkers();
    polylinesDrawer();
    notifyListeners();
  }

  List<LatLng> locations = [
    LatLng(6.8933195719838904, 79.86954594379145),
    LatLng(6.862642892043868, 79.86731434598757),
    LatLng(6.888509420590812, 79.87776159925401),
    LatLng(6.897541712279178, 79.87329840364625),
    LatLng(6.870124767826012, 79.88574385324523),
    LatLng(6.881713786225481, 79.89312529213498),
    LatLng(6.884781420232114, 79.90102171513334),
    LatLng(6.873874187060386, 79.89879011732945),
  ];


  pointMarkers() {
    for (int i = 0; i < locations.length; i++) {
     Marker markerValue = Marker(
        position: LatLng(locations[i].latitude, locations[i].longitude),
        markerId: MarkerId("$i"),
        icon: BitmapDescriptor.defaultMarker,
     );
     locationMarkers.add(markerValue);
    }
    notifyListeners();
  }

  polylinesDrawer() async{
    for (int i = 0; i < locations.length - 1; i++) {
      PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
          "AIzaSyDEDT6oQZHVSmXBZIdnZZXkhgphDQ8dCtg",
          PointLatLng(locations[i].latitude, locations[i].longitude),
          PointLatLng(locations[i+1].latitude, locations[i+1].longitude));
      if (result.points.isNotEmpty) {
        for (int j = 0; j < result.points.length; j++) {
          polylinesPoints.add(LatLng(
            result.points[j].latitude,
            result.points[j].longitude,)
          );
        }
      }
      notifyListeners();
    }
    notifyListeners();
    return polylinesPoints;
  }

}