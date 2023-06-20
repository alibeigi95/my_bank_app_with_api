import 'package:flutter/material.dart';

class MainTheme {
  static const Color primaryColor = Color(0xff3b9f2c);
  static const Color accountCard = Color(0xff226209);
  static const Color accountCardTwo = Color(0xff3B611C);
  static const Color secondaryColor = Color(0xff49454F);

  static BoxDecoration deActiveRadioButtonDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      border: Border.all(width: 1, color: const Color(0xff78909C)));
  static TextStyle deActiveRadioButtonTextStyle = const TextStyle(
      color: Color(0xff546E7A),
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static TextStyle activeRadioButtonTextStyle = const TextStyle(
      color: Color(0xffEDE8F4),
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static BoxDecoration activeRadioButtonDecoration = const BoxDecoration(
      color: Color(0xff83c07a),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}
