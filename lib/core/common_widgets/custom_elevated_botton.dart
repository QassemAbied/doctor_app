import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonName),
      ),
    );
  }
}
