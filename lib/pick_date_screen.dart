import 'package:flutter/material.dart';

class PickDateScreen extends StatelessWidget {
  const PickDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text("Child"),
          ),
        ),
      ),
    );
  }
}
