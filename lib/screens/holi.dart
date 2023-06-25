import 'package:flutter/material.dart';

import '../utils/widget.dart';

class holi extends StatefulWidget {
  const holi({Key? key}) : super(key: key);

  @override
  State<holi> createState() => _holiState();
}

class _holiState extends State<holi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Holi  Quote",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Getquotes(fas: "holi"),
    );
  }
}
