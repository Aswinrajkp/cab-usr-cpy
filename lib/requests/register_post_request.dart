import 'dart:convert';

import 'package:cab_user/helpers/dio_config.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';

Future<int?> registerPost(
    {required name, required password, required email, required phone}) async {
  String? userId;

  final data = {
    "name": name,
    "password": password,
    "email": email,
    "phone": phone
  };
  Response response;
  try {
    response = await mainDio.post("/users", data: data);

    var jsonData = json.decode(response.data);
    userId = jsonData["_id"];
    print(userId);

    IdStoring.setId(userId);
    return 200;
  } on Exception catch (e) {
    print(e.toString());
    return 400;
  }
}
