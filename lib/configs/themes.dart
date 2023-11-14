import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.cyan,
    // primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: kWhite), //<- Ngrubah Warna Drawer
    fontFamily: 'Poppins', //'DancingScript', //'Nova', //
  );

  static final dark = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    // fontFamily: 'Poppins',
  );
}


TextStyle get myLinkText {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kYellow,
  );
}

TextStyle get myLinkText2 {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kBlue,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.double,
  );
}

TextStyle getFont(double fontSize,
    {Color? color, bool isBold = false, String? fontName}) {
  return new TextStyle(
    fontSize: fontSize,
    color: color ?? kBlack,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: fontName,
  );
}

TextStyle setBold() {
  return new TextStyle(
    fontWeight: FontWeight.bold,
  );
}
