import 'dart:async';

import 'package:finans_app/core/doviz_service.dart';
import 'package:finans_app/features/doviz_features/model/AllCurrency.dart';
import 'package:finans_app/features/doviz_features/model/CurrencyToAll.dart';
import 'package:finans_app/features/doviz_features/model/DovizExchange.dart';
import 'package:finans_app/features/doviz_features/model/DovizSymbol.dart';
import 'package:mobx/mobx.dart';
part 'doviz_view_model.g.dart';

class DovizViewModel = _DovizViewModelBase with _$DovizViewModel;

abstract class _DovizViewModelBase with Store {
  @observable
  List<CurrencyToAll> dovizler = [];
  @observable
  List<AllCurrency> allCurrency = [];
  @observable
  List<String> allSymbols = [];
  @observable
  String convertedDoviz = "";

  Future<void> getAllByCurrency(String base) async {
    dovizler = await DovizService().getAllByCurrency(base);
  }

  Future<void> getAllCurrency() async {
    allCurrency = await DovizService().getAllCurrency();
  }

  Future<void> getAllSymbols() async {
    allSymbols = await DovizService().getAllSymbols();
  }

  Future<void> getConvertDovizBirim(
      String base, String to, double baseValue) async {
    DovizExchangeModel? model =
        await DovizService().getExchangeDoviz(base, to, baseValue);
    convertedDoviz = model!.calculatedstr.toString();
  }
}
