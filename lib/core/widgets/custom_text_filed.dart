import 'dart:core';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';

import '../theming/app_styles.dart';

// class CustomTextFiled {
//   static TextFormField textFormField({
//     required String hintText,
//      String prefixIcon,
//     required TextInputType textInputType,
//     required TextEditingController controller,
//     String? suffix,
//     Function? suffixPressed,
//     String? Function(String?)? validPressed,
//     bool isPassword = false,
//   }) {
//     return TextFormField(
//       keyboardType: textInputType,
//       controller: controller,
//       obscureText: isPassword,
//       validator: validPressed,
//       decoration: InputDecoration(
//         // prefixIcon: Padding(
//         //   padding: const EdgeInsets.only(left: 20, right: 10),
//         //   child: Image(
//         //     image: AssetImage(prefixIcon),
//         //     width: 25,
//         //     height: 25,
//         //   ),
//         // ),
//         suffixIcon: suffix != null
//             ? Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: GestureDetector(
//                     onTap: () {
//                       suffixPressed!();
//                     },
//                     child: Image(
//                       image: AssetImage(suffix),
//                       width: 25,
//                       height: 25,
//                     )),
//               )
//             : null,
//         hintText: hintText,
//         hintStyle: AppStyles.styleMedium14(ColorManager.lightGeryColor),
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(20.0),
//         //   borderSide: BorderSide(color: AppColors.greyOpacity),
//         // ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: BorderSide(color: ColorManager.lighterGeryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(color: ColorManager.mainBlueColor),
//         ),
//
//       ),
//
//     );
//   }
// }

class AppTextFiled extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? enabled;
  final bool? isPassword;
  final Function(String?) validator;
 final  bool? enable;
 final String? helperText;
  const AppTextFiled({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.textInputType,
    this.controller,
    this.suffix,
    this.isPassword, required this.validator, this.enable, this.helperText, this.labelText, this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus:enable?? false ,
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        enabled: enabled??true,
        helperText: helperText,
        labelText: labelText,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: AppStyles.styleMedium14(
          ColorManager.lightGeryColor,
          context,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: ColorManager.lighterGeryColor,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: ColorManager.mainBlueColor,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
      ),
      validator:(value){
        return validator(value);

      } ,
    );
  }
}
