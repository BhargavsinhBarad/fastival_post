import 'package:flutter/material.dart';

import '../utils/widget.dart';

class newyear extends StatefulWidget {
  const newyear({Key? key}) : super(key: key);

  @override
  State<newyear> createState() => _newyearState();
}

class _newyearState extends State<newyear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Newyear Quote",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Getquotes(fas: "newyear"),
    );
  }
}
