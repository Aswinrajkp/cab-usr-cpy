import 'package:cab_user/controller/map_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cab_user/main.dart';
import 'package:get/get.dart';

import '../../helpers/dio_exceptions.dart';

mapController controller = Get.put(mapController());

String baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
String accessToken =
    'sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ';
String searchType = 'place%2Cpostcode%2Caddress';
String searchResultsLimit = '5';
String proximity =
    '${controller.locationData.latitude}%2C${controller.locationData.latitude}';
String country = 'in';

Dio _dio = Dio();

Future getSearchResultsFromQueryUsingMapbox(String query) async {
  String url =
      '$baseUrl/$query.json?country=$country&limit=$searchResultsLimit&proximity=$proximity&types=$searchType&access_token=$accessToken';
  url = Uri.parse(url).toString();
  print(url);
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
    debugPrint(errorMessage);
  }
}
