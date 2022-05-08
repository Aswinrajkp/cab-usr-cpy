import 'package:dio/dio.dart';

Dio mainDio = Dio(options);

var options = BaseOptions(
  baseUrl: "http://0d8a-45-116-231-5.ngrok.io/api",
  responseType: ResponseType.plain,
);

