// To parse this JSON data, do
//
//     final vehicles = vehiclesFromJson(jsonString);

import 'dart:convert';

List<Vehicles> vehiclesFromJson(String? str) =>
    List<Vehicles>.from(json.decode(str!).map((x) => Vehicles.fromJson(x)));


class Vehicles {
  Vehicles({
    this.id,
    this.vehicleName,
    this.speed,
    this.charge,
    this.image,
  });

  String? id;
  String? vehicleName;
  int? speed;
  int? charge;
  String? image;

  factory Vehicles.fromJson(Map<String, dynamic> json) => Vehicles(
        id: json["_id"] == null ? null : json["_id"],
        vehicleName: json["vehicle_name"] == null ? null : json["vehicle_name"],
        speed: json["speed"] == null ? null : json["speed"],
        charge: json["charge"] == null ? null : json["charge"],
        image: json["image"] == null ? null : json["image"],
      );
}
