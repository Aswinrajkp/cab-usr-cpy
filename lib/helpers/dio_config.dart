import 'package:dio/dio.dart';

Dio mainDio = Dio(options);

var options = BaseOptions(
  baseUrl: "http://0a35-103-85-205-74.ngrok.io/api",
  responseType: ResponseType.plain,
);

