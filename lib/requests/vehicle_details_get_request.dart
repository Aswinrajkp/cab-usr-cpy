
import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/models/get_methords/vehicles_getting.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class VehicleDetailsServices extends GetxController {
Vehicles? vehicles;
late Response response;

  VehicleDetailsServices() {
    // TODO: implement onInit
    Dio dio = Dio();
  }

  Future gettingVehicleDetails() async {
   try {
    //  print(getController.distance);
       response = await mainDio.get("/vehicles");
       return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
  @override
  void onInit() {
    gettingVehicleDetails();
    // TODO: implement onInit
    super.onInit();
  }
}
