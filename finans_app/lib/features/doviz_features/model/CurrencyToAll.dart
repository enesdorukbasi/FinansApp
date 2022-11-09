// To parse this JSON data, do
//
//     final currencyToAll = currencyToAllFromJson(jsonString);

import 'dart:convert';

CurrencyToAll currencyToAllFromJson(String str) =>
    CurrencyToAll.fromJson(json.decode(str));

String currencyToAllToJson(CurrencyToAll data) => json.encode(data.toJson());

class CurrencyToAll {
  CurrencyToAll({
    this.code,
    this.name,
    this.rate,
    this.calculatedstr,
    this.calculated,
  });

  String? code;
  String? name;
  int? rate;
  String? calculatedstr;
  int? calculated;

  factory CurrencyToAll.fromJson(Map<String, dynamic> json) => CurrencyToAll(
        code: json["code"],
        name: json["name"],
        rate: json["rate"],
        calculatedstr: json["calculatedstr"],
        calculated: json["calculated"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "rate": rate,
        "calculatedstr": calculatedstr,
        "calculated": calculated,
      };
}
