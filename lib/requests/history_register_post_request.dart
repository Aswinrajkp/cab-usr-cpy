import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';

Future<int?> HistoryRegisterPost({email,password}) async {
  String? userId;

  final data = {
    "userId": email,
    "driverId": password,
    "vehicleId": password,
    "location1": password,
    "location2": password,
    "destination": password,
    "coordinate": password,
    "destinationCoordinate": password,
    "distance": password,
    "amount": password,
    "date": password,
  };

  try {
    Response response = await mainDio.post("/users/booktrip", data: data);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.data);
      userId = jsonData["_id"];
      // print(userId);

      IdStoring.setId(userId);

      return response.statusCode;
    } else {
      print("It's an error case");
    }
  } on Exception catch (e) {
    print(e.toString());
    return 400;
  }
}
