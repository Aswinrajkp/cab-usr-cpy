import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';

Future<int?> loginPost({required email, required password}) async {
  String? userId;

  final data = {
    "email": email,
    "password": password,
  };

  try {
    Response response = await mainDio.post("/users/login", data: data);
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
