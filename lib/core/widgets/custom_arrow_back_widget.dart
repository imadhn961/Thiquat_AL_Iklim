import 'package:flutter/material.dart';

class CustomArrowBackWidget extends StatelessWidget {
  const CustomArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 21,
      backgroundColor: Color(0xFF000000),
      child: CircleAvatar(
        backgroundColor: Color(0xFFFFFFFF),
        radius: 20,
        child: Icon(Icons.arrow_back, color: Color(0xFF000000)),
      ),
    );
  }
}
