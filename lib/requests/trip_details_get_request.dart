import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TripDetailsController extends GetxController {
  late Response response;
//  late List history;
  String? id;

 Future<List?>  historyGetting() async {
    id = await IdStoring.getId();
    print(id);
    try {
      response = await mainDio.get("/users/trips/$id");
      List history = json.decode(response.data);
      print(history.runtimeType);

      return history;
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
