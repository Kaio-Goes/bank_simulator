import 'package:flutter/material.dart';

const colorWhite = Colors.white;
const colorCard = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color.fromRGBO(43, 102, 188, 1), Color.fromRGBO(19, 45, 85, 1)]);

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
