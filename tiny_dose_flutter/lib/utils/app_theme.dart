import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    //primaryColor: Color(0x0065b9dc),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0x00a4ddf4),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(135, 45, 127, 159),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0x0042acd6),
      elevation: 10,
    ),
    fontFamily: 'TimesNewRoman');
