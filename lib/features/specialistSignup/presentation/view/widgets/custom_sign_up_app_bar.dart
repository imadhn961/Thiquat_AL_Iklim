import 'package:flutter/widgets.dart';

class CustomSignUpAppBar extends StatelessWidget {
  const CustomSignUpAppBar({super.key, required this.activeColor});
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
