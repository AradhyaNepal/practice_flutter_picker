import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:practice_flutter_picker/picker_data.dart';


class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  var firstValue="None";
  var secondValue="None";
  final _scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                showPicker(context);
              },
              child: const Text("Show"),
            ),
            Text("First Value = $firstValue\nSecond Value = $secondValue"),
          ],
        ),
      ),
    );
  }

  void showPicker(BuildContext context) {
    Picker picker = Picker(
      selectionOverlay: Container(
        decoration: const BoxDecoration(
        color: Colors.transparent,
          border: Border(top: BorderSide(color: Colors.green,width: 1),bottom:  BorderSide(color: Colors.green,width: 1))
        ),
      ),
        adapter: PickerDataAdapter<String>(pickerData: data),
        changeToFirst: true,
        textAlign: TextAlign.left,
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          final selectedValue=picker.getSelectedValues();
          print(selectedValue);
          firstValue=selectedValue[0];
          secondValue=selectedValue[1];
          setState(() {

          });
        }
    );
    picker.show(_scaffoldKey.currentState!);
  }
}
