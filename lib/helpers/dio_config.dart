import 'package:dio/dio.dart';

Dio mainDio = Dio(options);

var options = BaseOptions(
  baseUrl: "http://48f3-103-85-205-79.ngrok.io/api",
  responseType: ResponseType.plain,
);

