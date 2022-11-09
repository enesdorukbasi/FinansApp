import 'dart:convert';

CoinModel coinModelFromJson(String str) => CoinModel.fromJson(json.decode(str));

String coinModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  CoinModel({
    this.currency,
    this.changeWeek,
    this.changeWeekstr,
    this.changeDay,
    this.changeDaystr,
    this.changeHour,
    this.changeHourstr,
    this.volumestr,
    this.volume,
    this.pricestr,
    this.price,
    this.circulatingSupply,
    this.marketCapstr,
    this.marketCap,
    this.code,
    this.name,
  });

  String? currency;
  double? changeWeek;
  String? changeWeekstr;
  double? changeDay;
  String? changeDaystr;
  double? changeHour;
  String? changeHourstr;
  String? volumestr;
  String? volume;
  String? pricestr;
  double? price;
  String? circulatingSupply;
  String? marketCapstr;
  String? marketCap;
  String? code;
  String? name;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        currency: json["currency"],
        changeWeek: json["changeWeek"].toDouble(),
        changeWeekstr: json["changeWeekstr"],
        changeDay: json["changeDay"].toDouble(),
        changeDaystr: json["changeDaystr"],
        changeHour: json["changeHour"].toDouble(),
        changeHourstr: json["changeHourstr"],
        volumestr: json["volumestr"],
        volume: json["volume"].toString(),
        pricestr: json["pricestr"],
        price: json["price"].toDouble(),
        circulatingSupply: json["circulatingSupply"],
        marketCapstr: json["marketCapstr"],
        marketCap: json["marketCap"].toString(),
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "changeWeek": changeWeek,
        "changeWeekstr": changeWeekstr,
        "changeDay": changeDay,
        "changeDaystr": changeDaystr,
        "changeHour": changeHour,
        "changeHourstr": changeHourstr,
        "volumestr": volumestr,
        "volume": volume,
        "pricestr": pricestr,
        "price": price,
        "circulatingSupply": circulatingSupply,
        "marketCapstr": marketCapstr,
        "marketCap": marketCap,
        "code": code,
        "name": name,
      };
}
