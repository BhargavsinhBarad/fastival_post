import 'package:flutter/material.dart';

import '../utils/list.dart';
import '../utils/widget.dart';

class diwali extends StatefulWidget {
  const diwali({Key? key}) : super(key: key);

  @override
  State<diwali> createState() => _diwaliState();
}

class _diwaliState extends State<diwali> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Diwali Quote",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Getquotes(fas: "diwali"),
    );
  }
}
