import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:practice_flutter_picker/widgets/custom_selection.dart';

class PickDateScreen extends StatefulWidget {
  const PickDateScreen({super.key});

  @override
  State<PickDateScreen> createState() => _PickDateScreenState();
}

class _PickDateScreenState extends State<PickDateScreen> {
  late final pickerWidget=Picker(
      height: MediaQuery.of(context).size.height * 0.33,
      itemExtent: 40,
      backgroundColor: Colors.grey.shade100,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.black,
      ),
      selectionOverlay: const CustomSelector(),
      hideHeader: true,
      adapter: DateTimePickerAdapter(
        customColumnType: [1, 0, 2],
      ),
      onSelect: (picker, index, value) {
        print("ON CHanged $value");
      }).makePicker();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Birthday Calculator!"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Select Your Birth Year if you want to find your accurate Age",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                pickerWidget,
                const SizedBox(height: 20,),
                const Text(
                  "Your age",
                  style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
