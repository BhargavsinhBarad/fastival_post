import 'package:project/screens/details.dart';
import 'package:project/screens/diwali.dart';
import 'package:project/screens/holi.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/mahashivratri.dart';
import 'package:project/screens/newyear.dart';
import 'package:project/screens/rakshabandhan.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => home_page(),
        'diwali': (ctx) => diwali(),
        'newyear': (ctx) => newyear(),
        'holi': (ctx) => holi(),
        'mahashivratri': (ctx) => mahashivratri(),
        'rakshabandhan': (ctx) => rakshabandhan(),
        'details': (ctx) => details(),
      },
    ),
  );
}
