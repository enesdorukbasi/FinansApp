import 'dart:async';

import 'package:finans_app/features/doviz_features/view_model/doviz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DovizMainPage extends StatelessWidget {
  DovizMainPage({super.key});
  final _viewModel = DovizViewModel();
  Size? size;

  init() {
    _viewModel.getAllCurrency();
    Timer.periodic(new Duration(seconds: 3), (timer) {
      _viewModel.getAllCurrency();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    init();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Dövizler'),
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
                      'Alış',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: size!.width * 0.09,
                    ),
                    Text(
                      'Satış',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
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
      itemCount: _viewModel.allCurrency.length,
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
                _viewModel.allCurrency[index].name.toString(),
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
                      _viewModel.allCurrency[index].buying.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(width: size!.width * 0.05),
                    Text(
                      _viewModel.allCurrency[index].selling.toString(),
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
