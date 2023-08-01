
import 'package:flutter/material.dart';

class CustomSelector extends StatelessWidget {
  const CustomSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              top: BorderSide(color: Colors.green, width: 1),
              bottom: BorderSide(color: Colors.green, width: 1))),
    );
  }
}
