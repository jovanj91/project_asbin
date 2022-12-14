import 'package:flutter/material.dart';
import 'package:project_asbin/utils/size_config.dart';

const kPrimaryColor = Colors.green;
const kPrimaryLightColor = Color.fromARGB(255, 82, 202, 86);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]
);
const kSecondaryColor = Color.fromARGB(255, 121, 127, 129);
const kTextColor = Colors.black;

const kAnimationDration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5
);