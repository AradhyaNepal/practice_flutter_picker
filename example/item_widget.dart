
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';

import 'picker_data.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
  });

  final value1=[
    "Number",
    "Alphabets",
    "Symbols",
    "Names",
    "Gender",
  ];
  final value2=[
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
  ];
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showPicker(context);
          },
          child: const Text("Show"),
        ),
      ),
    );
  }

  void showPicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(pickerData: data),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );
    picker.show(_scaffoldKey.currentState!);
  }
}
