// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes:
    {
      '/': (context) => Loading(),
      '/Home': (context) => Home(),
      '/Location': (context) => ChooseLocation()
    },
  ));
}
