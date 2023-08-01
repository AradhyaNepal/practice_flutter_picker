import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final textFieldController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedValueController = [0, 0];
  final selectNameData = [
    {
      "Aradhya": ["A", "R", "A", "D", "H", "Y", "A"]
    },
    {
      "Gopal": ["G", "O", "P", "A", "L"]
    },
    {
      "Nepal": ["N", "E", "P", "A", "L"]
    }
  ];

  late final pickerHeight=MediaQuery.of(context).size.height * 0.3;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (details) {
        if(details.globalPosition.dy<size.height-pickerHeight){
          if (picker != null) {
            picker?.doConfirm(context);
            picker = null;
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          padding: const EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Enter Your Name"),
              GestureDetector(
                onTap: () {
                  if(picker!=null)return;
                  showPicker(context);
                },
                child: TextField(
                  controller: textFieldController,
                  enabled: false,
                  decoration:
                      const InputDecoration(labelText: "Name with fav letter"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Picker? picker;

  void showPicker(BuildContext context) {
    picker = Picker(
        itemExtent: 40,
        backgroundColor: Colors.grey.shade100,
        height: pickerHeight,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.black,
        ),
        hideHeader: true,
        selecteds: selectedValueController,
        selectionOverlay: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  top: BorderSide(color: Colors.green, width: 1),
                  bottom: BorderSide(color: Colors.green, width: 1))),
        ),
        adapter: PickerDataAdapter<String>(pickerData: selectNameData),
        textAlign: TextAlign.left,
        onConfirm: (Picker picker, List value) {
          final selectedValue = picker.getSelectedValues();
          textFieldController.text =
              "${selectedValue[0]} with ${selectedValue[1]}";
        });
    picker?.show(_scaffoldKey.currentState!);
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}
