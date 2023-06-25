import 'package:flutter/material.dart';

import '../utils/widget.dart';

class rakshabandhan extends StatefulWidget {
  const rakshabandhan({Key? key}) : super(key: key);

  @override
  State<rakshabandhan> createState() => _rakshabandhanState();
}

class _rakshabandhanState extends State<rakshabandhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Rakshabandhan Quote",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Getquotes(fas: "rakshabandhan"),
    );
  }
}
