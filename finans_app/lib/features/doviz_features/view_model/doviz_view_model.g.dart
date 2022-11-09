// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DovizViewModel on _DovizViewModelBase, Store {
  late final _$dovizlerAtom =
      Atom(name: '_DovizViewModelBase.dovizler', context: context);

  @override
  List<CurrencyToAll> get dovizler {
    _$dovizlerAtom.reportRead();
    return super.dovizler;
  }

  @override
  set dovizler(List<CurrencyToAll> value) {
    _$dovizlerAtom.reportWrite(value, super.dovizler, () {
      super.dovizler = value;
    });
  }

  late final _$allCurrencyAtom =
      Atom(name: '_DovizViewModelBase.allCurrency', context: context);

  @override
  List<AllCurrency> get allCurrency {
    _$allCurrencyAtom.reportRead();
    return super.allCurrency;
  }

  @override
  set allCurrency(List<AllCurrency> value) {
    _$allCurrencyAtom.reportWrite(value, super.allCurrency, () {
      super.allCurrency = value;
    });
  }

  late final _$allSymbolsAtom =
      Atom(name: '_DovizViewModelBase.allSymbols', context: context);

  @override
  List<String> get allSymbols {
    _$allSymbolsAtom.reportRead();
    return super.allSymbols;
  }

  @override
  set allSymbols(List<String> value) {
    _$allSymbolsAtom.reportWrite(value, super.allSymbols, () {
      super.allSymbols = value;
    });
  }

  late final _$convertedDovizAtom =
      Atom(name: '_DovizViewModelBase.convertedDoviz', context: context);

  @override
  String get convertedDoviz {
    _$convertedDovizAtom.reportRead();
    return super.convertedDoviz;
  }

  @override
  set convertedDoviz(String value) {
    _$convertedDovizAtom.reportWrite(value, super.convertedDoviz, () {
      super.convertedDoviz = value;
    });
  }

  @override
  String toString() {
    return '''
dovizler: ${dovizler},
allCurrency: ${allCurrency},
allSymbols: ${allSymbols},
convertedDoviz: ${convertedDoviz}
    ''';
  }
}
