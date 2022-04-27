import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class AvailableVehicles extends GetxController {
  late Response response;
  List availableVehicles = [];
 late var VehicleId = availableVehicles[0]["_id"];

  gettingAvailableVehilces() async {
    try {
      response = await mainDio.get("/vehicles/available?type=Mini");
      Map data = json.decode(response.data);
      availableVehicles = data["result"];
      print(availableVehicles[0]["_id"]);
      return availableVehicles[0]["_id"];
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
