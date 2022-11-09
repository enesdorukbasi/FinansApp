import 'dart:async';

import 'package:finans_app/features/coin_features/view_model/coin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CoinMainPage extends StatelessWidget {
  final _viewModel = CoinViewModel();
  Size? size;

  CoinMainPage({Key? key}) : super(key: key);

  init() {
    Timer.periodic(new Duration(seconds: 3), (timer) {
      _viewModel.getAllCoins();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    init();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Coinler'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size!.width * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Fiyat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(width: size!.width * 0.10)
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Observer(
            builder: (_) {
              return _getList();
            },
          ))
        ],
      ),
    );
  }

  Widget _getList() {
    return ListView.builder(
      itemCount: _viewModel.allCoins.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                _viewModel.allCoins[index].name.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _viewModel.allCoins[index].price.toString() + r" $",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
