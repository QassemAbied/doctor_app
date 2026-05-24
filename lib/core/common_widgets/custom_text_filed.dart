import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? enabled;
  final bool? isPassword;
  final Function(String?) validator;
  final bool? enable;
  final String? helperText;
  const AppTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.textInputType,
    this.controller,
    this.suffix,
    this.isPassword,
    required this.validator,
    this.enable,
    this.helperText,
    this.labelText,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: enable ?? false,
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        helperText: helperText,
        labelText: labelText,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        suffixIcon: suffix,
        hintText: hintText,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
