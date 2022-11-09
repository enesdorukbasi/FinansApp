import 'package:finans_app/features/doviz_features/view/doviz_main_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navbar_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        backgroundColor: Colors.grey[900],
        primaryColor: Colors.yellow,
        dialogBackgroundColor: Colors.grey[800],
      ),
      home: BottomNavbarPage(),
    );
  }
}
