import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:practice_flutter_picker/widgets/custom_selection.dart';

class PickDateScreen extends StatefulWidget {
  const PickDateScreen({super.key});

  @override
  State<PickDateScreen> createState() => _PickDateScreenState();
}

class _PickDateScreenState extends State<PickDateScreen> {
  int minimumAgeLimit=18;
  late final selectedValueController = <int>[];
  final todayDate=DateTime.now();
  int startYear=1900;
  late int endYear=todayDate.year;

  ///This picker is stored in separate variable because [makePicker] method is used
  ///So if i set this method in build then this widget will rebuild on every setState
  late final pickerWidget = Picker(
      height: MediaQuery.of(context).size.height * 0.33,
      selecteds: selectedValueController,
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
        value: todayDate.subtract(Duration(days: minimumAgeLimit*365)),
        yearBegin: startYear,
        yearEnd: endYear,
        customColumnType: [1, 2, 0],
      ),
      onSelect: (picker, index, value) {
        setState(() {});
      }).makePicker();

  DateTime get selectedBirthDay =>
      DateTime(selectedYear, selectedMonth,selectedDay);

  int get selectedYear=>selectedValueController[2] + startYear;
  int get selectedMonth=>selectedValueController[0] + 1;
  int get selectedDay=>selectedValueController[1]+1;

  String get ageResult{
    return AgeCalculator.age(selectedBirthDay).toString();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      setState(() {
        //Set State is done to sync default selected value with our [selectedValueController]
      });
    });
  }

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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your age is\n$ageResult",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
