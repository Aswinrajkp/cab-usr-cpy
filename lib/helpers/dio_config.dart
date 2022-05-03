import 'package:dio/dio.dart';

Dio mainDio = Dio(options);

var options = BaseOptions(
  baseUrl: "http://f324-103-85-204-229.ngrok.io/api",
  responseType: ResponseType.plain,
);

