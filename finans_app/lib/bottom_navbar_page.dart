import 'package:bottom_bar/bottom_bar.dart';
import 'package:finans_app/features/coin_features/view/coin_main_page.dart';
import 'package:finans_app/features/doviz_features/view/doviz_exchange_page.dart';
import 'package:finans_app/features/doviz_features/view/doviz_main_page.dart';
import 'package:finans_app/features/doviz_features/view/doviz_search_page.dart';
import 'package:flutter/material.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _currentPageIndex = 0;
  final _pageList = [];
  @override
  void initState() {
    super.initState();
    _pageList.add(DovizMainPage());
    _pageList.add(CoinMainPage());
    _pageList.add(DovizExchangePage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        backgroundColor: Theme.of(context).backgroundColor,
        selectedIndex: _currentPageIndex,
        onTap: (value) {
          if (_currentPageIndex != value) {
            _currentPageIndex = value;
            setState(() {});
          }
        },
        items: [
          BottomBarItem(
            icon: const Icon(Icons.attach_money),
            activeIconColor: Theme.of(context).primaryColor,
            title: Text('Dövizler',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            activeColor: Theme.of(context).primaryColorLight,
          ),
          BottomBarItem(
            icon: const Icon(Icons.currency_bitcoin),
            activeIconColor: Theme.of(context).primaryColor,
            title: Text('Coinler',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            activeColor: Theme.of(context).primaryColorLight,
          ),
          BottomBarItem(
            icon: const Icon(Icons.currency_exchange),
            activeIconColor: Theme.of(context).primaryColor,
            title: Text('Hesapla',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            activeColor: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
      body: _pageList[_currentPageIndex],
    );
  }
}
