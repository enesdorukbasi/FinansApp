import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:finans_app/features/doviz_features/view_model/doviz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DovizExchangePage extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _convertedController = new TextEditingController();
  DropdownEditingController<String> _baseController =
      new DropdownEditingController();
  DropdownEditingController<String> _toController =
      new DropdownEditingController();
  final _viewModel = DovizViewModel();
  Size? size;

  DovizExchangePage({Key? key}) : super(key: key);

  init() async {
    await _viewModel.getAllSymbols();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    init();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Çevir'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size!.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size!.width * 0.4,
                              child: Observer(builder: (_) {
                                return TextDropdownFormField(
                                  options: _viewModel.allSymbols,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    labelText: "Mevcut Döviz",
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  dropdownHeight: size!.height * 0.09,
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: size!.width * 0.4,
                              child: Observer(builder: (_) {
                                return TextDropdownFormField(
                                  controller: _toController,
                                  options: _viewModel.allSymbols,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    suffixIcon:
                                        const Icon(Icons.arrow_drop_down),
                                    labelText: "Çevirilecek Döviz",
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    disabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    helperStyle:
                                        const TextStyle(color: Colors.white),
                                  ),
                                  dropdownHeight: size!.height * 0.09,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size!.height * 0.05),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size!.width * 0.34,
                              child: TextFormField(
                                controller: _textEditingController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  label: Text('Çevirilecek Miktar'),
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: size!.width * 0.01),
                            IconButton(
                                onPressed: () async {
                                  if (_textEditingController.text != "") {
                                    double baseValue = double.parse(
                                        _textEditingController.text);
                                    String base =
                                        _baseController.value.toString();
                                    String to = _toController.value.toString();

                                    await _viewModel.getConvertDovizBirim(
                                        'TRY', 'USD', baseValue);
                                    _convertedController.text = await _viewModel
                                        .convertedDoviz
                                        .toString();
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_circle_right,
                                  color: Colors.white,
                                )),
                            SizedBox(width: size!.width * 0.01),
                            SizedBox(
                              width: size!.width * 0.34,
                              child: TextFormField(
                                controller: _convertedController,
                                enabled: false,
                                readOnly: true,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
