import 'package:flutter/material.dart';
import 'package:tfc/pages/home.dart';
import 'package:tfc/pages/login.dart';
import 'package:tfc/pages/loading.dart';
import 'package:tfc/pages/password.dart';

void main() {


  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/home': (context) => Home(),
      '/password': (context) => Password(),
      '/loading': (context) => Loading(),

    },
  ));
}

