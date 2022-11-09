import 'dart:convert';

AllCurrency allCurrencyFromJson(String str) =>
    AllCurrency.fromJson(json.decode(str));

String allCurrencyToJson(AllCurrency data) => json.encode(data.toJson());

class AllCurrency {
  AllCurrency({
    this.name,
    this.buying,
    this.selling,
  });

  String? name;
  String? buying;
  String? selling;

  factory AllCurrency.fromJson(Map<String, dynamic> json) => AllCurrency(
        name: json["name"],
        buying: json["buyingstr"],
        selling: json["sellingstr"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "buying": buying,
        "selling": selling,
      };
}
