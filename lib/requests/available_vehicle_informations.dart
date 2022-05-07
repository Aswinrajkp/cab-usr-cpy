
import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';


class AvailableVehicleInformation extends GetxController {
  late Response response;
  String? id = "";

  idAssigning(data) async {
    id = data;
    update();
  }
    
    gettingAvailableVehicleDetails(data) async {
      try{
            response = await mainDio.get("/driver/info?Id=$data");
            print(response.data);
      }on DioError catch(e){
           print(e.toString());
      }
    }

  //gettingAvailableVehilces(vehicleName) async {
  //   try {
  //     print("Getting Available Vehicles");
  //     response = await mainDio.get("/vehicles/available?type=$vehicleName");
  //     Map data = json.decode(response.data);
  //     availableVehicles = data["result"];
  //     print(availableVehicles[0]);
  //     return availableVehicles[0]["_id"];
  //   } on DioError catch (e) {
  //     print(e.toString());
  //   }
  // }
}
