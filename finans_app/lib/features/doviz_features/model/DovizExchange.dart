import 'dart:convert';

DovizExchangeModel dovizExchangeFromJson(String str) =>
    DovizExchangeModel.fromJson(json.decode(str));

String dovizExchangeToJson(DovizExchangeModel data) =>
    json.encode(data.toJson());

class DovizExchangeModel {
  DovizExchangeModel({
    this.code,
    this.name,
    this.rate,
    this.calculatedstr,
    this.calculated,
  });

  String? code;
  String? name;
  String? rate;
  String? calculatedstr;
  double? calculated;

  factory DovizExchangeModel.fromJson(Map<String, dynamic> json) =>
      DovizExchangeModel(
        code: json["code"],
        name: json["name"],
        rate: json["rate"],
        calculatedstr: json["calculatedstr"],
        calculated: json["calculated"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "rate": rate,
        "calculatedstr": calculatedstr,
        "calculated": calculated,
      };
}
