import 'package:dio/dio.dart';

Dio mainDio = Dio(options);

var options = BaseOptions(
  baseUrl: "https://cab-hub1.herokuapp.com/api",
  responseType: ResponseType.plain,
);

