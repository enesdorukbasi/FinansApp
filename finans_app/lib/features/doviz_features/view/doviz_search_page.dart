import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text('Ara'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              _searchBar(context),
            ],
          ),
        ));
  }

  Widget _searchBar(context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        hintText: 'Ara...',
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        fillColor: Theme.of(context).dialogBackgroundColor.withOpacity(0.7),
        filled: true,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
