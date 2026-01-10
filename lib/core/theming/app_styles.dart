import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleBold32(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold18(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold16(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w700);
  }

  static TextStyle styleRegular13(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w400);
  }

  static TextStyle styleSemiBold16(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle styleSemiBold18(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600);
  }
  static TextStyle styleSemiBold14(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600);
  }

  static TextStyle styleBold24(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w700);
  }

  static TextStyle styleMedium14(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500);
  }

  static TextStyle styleMedium12(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500);
  }

  static TextStyle styleMedium16(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);
  }

  static TextStyle styleRegular14(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400);
  }

  static TextStyle styleRegular12(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400);
  }

  //   static TextStyle styleBold30(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 30),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.bold,
  //     );
  //   }
  //
  //   // static TextStyle styleBold18(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 18,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleBold21(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 21,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleBold40(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 40,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   static TextStyle styleBold24(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 24),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.bold,
  //       height: 0,
  //     );
  //   }
  //
  //   // static TextStyle styleBold17(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 17,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleBold10(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 10,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   static TextStyle styleBold16(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 16),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.bold,
  //       height: 0,
  //     );
  //   }
  //
  //   // static TextStyle styleBold14(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 14,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.bold,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleRegular16(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 16,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w400,
  //   //   );
  //   // }
  //
  //   static TextStyle styleRegular20(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 20),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.w400,
  //     );
  //   }
  //
  //   // static TextStyle styleRegular14(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 14,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w400,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium12(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 12,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium20(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 20,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium14(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 14,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium16(
  //   //     Color color,
  //   //     ) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 16,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium24(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 24,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium10(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 10,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //     // height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleMedium18(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 18,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w500,
  //   //   );
  //   // }
  //
  //   static TextStyle styleSemiBold20(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 20),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.w600,
  //       height: 0,
  //     );
  //   }
  //
  //   // static TextStyle styleSemiBold24(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 24,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w600,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   // static TextStyle styleSemiBold18(Color color) {
  //   //   return TextStyle(
  //   //     color: color,
  //   //     fontSize: 18,
  //   //     fontFamily: 'Roboto',
  //   //     fontWeight: FontWeight.w600,
  //   //     height: 0,
  //   //   );
  //   // }
  //
  //   static TextStyle styleSemiBold25(Color color,BuildContext context) {
  //     return TextStyle(
  //       color: color,
  //       fontSize: getResponsiveFontSize(context, fontSize: 25),
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.w600,
  //       height: 0,
  //     );
  //   }
  //
  // // static TextStyle styleSemiBold12(Color color) {
  // //   return TextStyle(
  // //     color: color,
  // //     fontSize: 12,
  // //     fontFamily: 'Roboto',
  // //     fontWeight: FontWeight.w600,
  // //     height: 0,
  // //   );
  // // }
  //
  // // static TextStyle styleSemiBold14(Color color) {
  // //   return TextStyle(
  // //     color: color,
  // //     fontSize: 14,
  // //     fontFamily: 'Roboto',
  // //     fontWeight: FontWeight.w600,
  // //     height: 0,
  // //   );
  // // }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1000) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
