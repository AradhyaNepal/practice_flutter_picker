import 'package:flutter/material.dart';
import 'package:practice_flutter_picker/pick_date_screen.dart';

import 'select_names_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          SelectNamesScreen(),
          PickDateScreen(),
        ],
      ),
    );
  }
}
