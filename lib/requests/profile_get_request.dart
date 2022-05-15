import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class ProfileGettingController extends GetxController{
 late Response response;
var profile;
 var user = FirebaseAuth.instance.currentUser;
 String? id;
 

 profileGetting() async {
    id =await IdStoring.getId();
   print(id);
    try {
      response = await mainDio.get("/users/profile/$id");
      profile = json.decode(response.data);
      print(profile);
      return profile;
    } on DioError catch (e) {
    print(e.toString());
    }
 }
 @override
  void onInit() {
    // profileGetting();
    super.onInit();
  }
} 