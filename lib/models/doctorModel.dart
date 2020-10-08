// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.address,
    this.categoryTags,
    this.doctorId,
    this.doctorName,
    this.fee,
    this.phoneNumber,
    this.rating,
    this.location,
    this.male,
  });

  String address;
  List<String> categoryTags;
  String doctorId;
  String doctorName;
  double fee;
  String phoneNumber;
  double rating;
  Location location;
  bool male;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    address: json["address"],
    categoryTags: List<String>.from(json["categoryTags"].map((x) => x)),
    doctorId: json["doctor_id"],
    doctorName: json["doctor_name"],
    fee: json["fee"].toDouble(),
    phoneNumber: json["phoneNumber"],
    rating: json["rating"].toDouble(),
    location: Location.fromJson(json["location"]),
    male: json["male"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "categoryTags": List<dynamic>.from(categoryTags.map((x) => x)),
    "doctor_id": doctorId,
    "doctor_name": doctorName,
    "fee": fee,
    "phoneNumber": phoneNumber,
    "rating": rating,
    "location": location.toJson(),
    "male": male,
  };
}

class Location {
  Location({
    this.geopoint,
    this.geohash,
  });

  GeoPoint geopoint;
  String geohash;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    geopoint: json["geopoint"],
    geohash: json["geohash"],
  );

  Map<String, dynamic> toJson() => {
    "geopoint": geopoint,
    "geohash": geohash,
  };
}
