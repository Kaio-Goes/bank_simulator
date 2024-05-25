import 'package:flutter/material.dart';

const colorWhite = Colors.white;
const colorWhiteTransparent = Color.fromRGBO(229, 229, 229, 0.7);
const colorBlack = Colors.black;
const colorBlackLight = Color.fromRGBO(0, 0, 0, 0.7);
const colorBlueShape = Color.fromRGBO(40, 144, 207, 1);

const colorCard = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color.fromRGBO(43, 102, 188, 1), Color.fromRGBO(19, 45, 85, 1)]);

const colorCard2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color.fromRGBO(0, 81, 83, 0.411), Color.fromRGBO(0, 81, 83, 1)]);

const colorGradientWhite = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromRGBO(54, 97, 161, 0.411),
      Color.fromRGBO(54, 96, 161, 1)
    ]);

const colorGradientWhite2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromRGBO(140, 207, 182, 0.451),
      Color.fromRGBO(9, 105, 73, 1)
    ]);

const iconMenu = Icon(
  Icons.menu_rounded,
  size: 35,
  color: Colors.white,
);

const iconNotification = Icon(
  Icons.notification_add_outlined,
  size: 35,
  color: Colors.white,
);

const textTitle =
    TextStyle(color: colorWhite, fontSize: 20.0, fontFamily: 'Mulish');

const textBoldTitle = TextStyle(
    color: colorWhite,
    fontSize: 20.0,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.bold);

const textLight = TextStyle(
  color: colorWhite,
  fontSize: 17.0,
  fontFamily: 'Mulish',
  fontWeight: FontWeight.w100,
);

const textNumberCard = TextStyle(
  color: colorWhite,
  fontSize: 17.0,
  fontFamily: 'Mulish',
);

const textLabelCard = TextStyle(
  color: colorWhite,
  fontSize: 11.0,
  fontFamily: 'Mulish',
  letterSpacing: -0.8,
);

const textBlack = TextStyle(
  color: colorBlack,
  fontSize: 20.0,
  fontFamily: 'Mulish',
  fontWeight: FontWeight.bold,
  letterSpacing: -0.8,
);

const textBlackLight = TextStyle(
  color: colorBlackLight,
  fontSize: 11.0,
  fontFamily: 'Mulish',
  letterSpacing: -0.8,
);

const textBlackButton = TextStyle(
  color: colorBlack,
  fontSize: 14.0,
  fontFamily: 'Mulish',
  letterSpacing: -0.8,
);
