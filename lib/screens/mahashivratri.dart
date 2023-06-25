import 'package:flutter/material.dart';

import '../utils/widget.dart';

class mahashivratri extends StatefulWidget {
  const mahashivratri({Key? key}) : super(key: key);

  @override
  State<mahashivratri> createState() => _mahashivratriState();
}

class _mahashivratriState extends State<mahashivratri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Mahashivratri Quote",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Getquotes(fas: "mahashivratri"),
    );
  }
}
