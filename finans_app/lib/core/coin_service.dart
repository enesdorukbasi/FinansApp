import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finans_app/features/coin_features/model/CoinModel.dart';

class CoinService {
  final String _apiCoinUrl = 'https://api.collectapi.com/economy/';
  final String _apiKey = '';

  Future<List<CoinModel>> getAllCoins() async {
    List<CoinModel> coins = [];

    var response = await Dio().get(
      _apiCoinUrl + 'cripto',
      options: Options(headers: {
        'authorization': _apiKey,
        'content-type': 'application/json',
      }),
    );

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data['result'] as List;

      coins = responseDatas.map((e) => CoinModel.fromJson(e)).toList();
    }

    return coins;
  }
}
