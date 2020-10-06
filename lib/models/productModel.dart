// To parse this JSON data, do
//
//     final productMode = productModeFromJson(jsonString);

import 'dart:convert';

ProductModel productModeFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModeToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.brandName,
    this.unit,
    this.dosageDescription,
    this.strength,
    this.price,
    this.manufacturer,
  });

  String brandName;
  String unit;
  String dosageDescription;
  String strength;
  double price;
  String manufacturer;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    brandName: json["brandName"],
    unit: json["unit"],
    dosageDescription: json["dosageDescription"],
    strength: json["strength"],
    price: json["price"].toDouble(),
    manufacturer: json["manufacturer"],
  );

  Map<String, dynamic> toJson() => {
    "brandName": brandName,
    "unit": unit,
    "dosageDescription": dosageDescription,
    "strength": strength,
    "price": price,
    "manufacturer": manufacturer,
  };
}
