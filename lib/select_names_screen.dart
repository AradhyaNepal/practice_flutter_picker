import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:practice_flutter_picker/widgets/custom_selection.dart';

class SelectNamesScreen extends StatefulWidget {
  const SelectNamesScreen({
    super.key,
  });

  @override
  State<SelectNamesScreen> createState() => _SelectNamesScreenState();
}

class _SelectNamesScreenState extends State<SelectNamesScreen> {
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

  late final pickerHeight = MediaQuery.of(context).size.height * 0.3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTapDown: (details) {
          if (details.globalPosition.dy < size.height - pickerHeight) {
            _hidePicker(size, context);
          }
        },
        child: Scaffold(
          floatingActionButton: const Text(
            "Scroll Down for another page",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          key: _scaffoldKey,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Enter Your Name"),
                GestureDetector(
                  onTap: () {
                    if (picker != null) {
                      _hidePicker(size, context);
                    } else {
                      showPicker(context);
                    }
                  },
                  child: TextField(
                    controller: textFieldController,
                    enabled: false,
                    decoration: const InputDecoration(
                        labelText: "Name with fav letter"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _hidePicker(Size size, BuildContext context) {
    if (picker != null) {
      picker?.doConfirm(context);
      picker = null;
    }
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
        selectionOverlay: const CustomSelector(),
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
