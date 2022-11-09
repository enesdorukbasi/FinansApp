import 'dart:convert';

DovizSymbolModel dovizSymbolModelFromJson(String str) =>
    DovizSymbolModel.fromJson(json.decode(str));

String dovizSymbolModelToJson(DovizSymbolModel data) =>
    json.encode(data.toJson());

class DovizSymbolModel {
  DovizSymbolModel({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DovizSymbolModel.fromJson(Map<String, dynamic> json) =>
      DovizSymbolModel(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
