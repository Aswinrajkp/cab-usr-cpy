import 'dart:convert';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:intl/intl.dart';

import '../requests/map_requests/mapbox_directions.dart';
import '../requests/map_requests/mapbox_rev_geocoding.dart';
import '../requests/map_requests/mapbox_search.dart';

// ----------------------------- Mapbox Search Query -----------------------------
String getValidatedQueryFromQuery(String query) {
  String validatedQuery = query.trim();
  return validatedQuery;
}

Future<List> getParsedResponseForQuery(String value) async {
  List parsedResponses = [];

  // If empty query send blank response
  String query = getValidatedQueryFromQuery(value);
  if (query == '') return parsedResponses;

  // Else search and then send response
  var response = json.decode(await getSearchResultsFromQueryUsingMapbox(query));

  List features = response['features'];
  for (var feature in features) {
    Map response = {
      'name': feature['text'],
      'address': feature['place_name'].split('${feature['text']}, ')[1],
      'place': feature['place_name'],
      'location': LatLng(feature['center'][1], feature['center'][0])
    };
    parsedResponses.add(response);
  }
  return parsedResponses;
}

// ----------------------------- Mapbox Reverse Geocoding -----------------------------
Future<Map> getParsedReverseGeocoding(LatLng latLng) async {
  var response =
      json.decode(await getReverseGeocodingGivenLatLngUsingMapbox(latLng));
  Map feature = response['features'][0];
  Map revGeocode = {
    'name': feature['text'],
    'address': feature['place_name'].split('${feature['text']}, ')[1],
    'place': feature['place_name'],
    'location': latLng
  };
  return revGeocode;
}

// ----------------------------- Mapbox Directions API -----------------------------
Future<Map> getDirectionsAPIResponse(
    // LatLng sourceLatLng, LatLng destinationLatLng
    ) async {
  print(getController.pickupLocation);
  print(getController.destinationLocation);
  final response = await getCyclingRouteUsingMapbox(
      getController.pickupLocation, getController.destinationLocation);
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;
}

LatLng getCenterCoordinatesForPolyline(Map geometry) {
  List coordinates = geometry['coordinates'];
  int pos = (coordinates.length / 2).round();
  return LatLng(coordinates[pos][1], coordinates[pos][0]);
}


getTripLatlng(String type) {
  List sourceLocationList = json.decode(getController.pickupjson)['location'];
  List destinationLocationList =
      json.decode(getController.destination)['location'];
  LatLng source = LatLng(sourceLocationList[0], sourceLocationList[1]);
  LatLng destination =
      LatLng(destinationLocationList[0], destinationLocationList[1]);

  if (type == 'source') {
    print("source is passing");
    return source;
  } else {
    
    print("destination is passing");
    return destination;
  }
}

String getSourceAndDestinationPlaceText(String type) {
  String sourceAddress = json.decode(getController.response[0])['name'];
  String destinationAddress = json.decode(getController.response[1])['name'];

  if (type == 'source') {
    return sourceAddress;
  } else {
    return destinationAddress;
  }
}




String getDropOffTime(num duration) {
  int minutes = (duration / 60).round();
  int seconds = (duration % 60).round();
  DateTime tripEndDateTime =
      DateTime.now().add(Duration(minutes: minutes, seconds: seconds));
  String dropOffTime = DateFormat.jm().format(tripEndDateTime);
  return dropOffTime;
}

