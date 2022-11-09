import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finans_app/features/doviz_features/model/AllCurrency.dart';
import 'package:finans_app/features/doviz_features/model/CurrencyToAll.dart';
import 'package:finans_app/features/doviz_features/model/DovizExchange.dart';
import 'package:finans_app/features/doviz_features/model/DovizSymbol.dart';
import 'package:http/http.dart' as http;

class DovizService {
  final String _getByMoneyTypeUrl = 'https://api.collectapi.com/economy/';
  final String _apiKey = '';

  Future<List<CurrencyToAll>> getAllByCurrency(String base) async {
    List<CurrencyToAll> dovizler = [];

    var response = await Dio().get(
      _getByMoneyTypeUrl + "currencyToAll?int=1&base=$base",
      options: Options(
        headers: {
          "authorization": _apiKey,
          "content-type": "application/json",
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data['result']['data'] as List;

      dovizler = responseDatas.map((e) => CurrencyToAll.fromJson(e)).toList();
    }
    return dovizler;
  }

  Future<List<AllCurrency>> getAllCurrency() async {
    List<AllCurrency> allCurrencies = [];

    var response = await Dio().get(
      _getByMoneyTypeUrl + "allCurrency",
      options: Options(
        headers: {
          "authorization": _apiKey,
          "content-type": "application/json",
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data['result'] as List;

      allCurrencies =
          responseDatas.map((e) => AllCurrency.fromJson(e)).toList();
    }
    return allCurrencies;
  }

  Future<List<String>> getAllSymbols() async {
    List<String> dovizSybmols = [];
    var response = await Dio().get(
      _getByMoneyTypeUrl + "symbols",
      options: Options(
        headers: {
          "authorization": _apiKey,
          "content-type": "application/json",
        },
      ),
    );

    // var response =
    //     await http.get(Uri.parse(_getByMoneyTypeUrl + 'symbols'), headers: {
    //   "authorization": "apikey 0Jk6uVQ5QGmsFvSgrrKta8:41ALx7yrlifKphZww4Etin",
    //   "content-type": "application/json",
    // });

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data['result'] as List;

      dovizSybmols = responseDatas
          .map((e) => DovizSymbolModel.fromJson(e).code.toString())
          .toList();
    }

    return dovizSybmols;
  }

  Future<DovizExchangeModel?> getExchangeDoviz(
      String base, String to, double baseValue) async {
    List<DovizExchangeModel> exchangeList = [];

    var response = await Dio().get(
      _getByMoneyTypeUrl +
          "exchange?int=${baseValue.toString()}&to=$to&base=$base",
      options: Options(
        headers: {
          "authorization": _apiKey,
          "content-type": "application/json",
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data['result']['data'];

      DovizExchangeModel exchangedModel =
          DovizExchangeModel.fromJson(responseDatas[0]);

      return exchangedModel;
    }

    return null;
  }
}
