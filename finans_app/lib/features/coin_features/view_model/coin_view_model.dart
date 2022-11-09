import 'dart:async';
import 'dart:ffi';

import 'package:finans_app/core/coin_service.dart';
import 'package:finans_app/features/coin_features/model/CoinModel.dart';
import 'package:mobx/mobx.dart';
part 'coin_view_model.g.dart';

class CoinViewModel = _CoinViewModelBase with _$CoinViewModel;

abstract class _CoinViewModelBase with Store {
  @observable
  List<CoinModel> allCoins = [];

  Future<void> getAllCoins() async {
    allCoins = await CoinService().getAllCoins();
  }
}
