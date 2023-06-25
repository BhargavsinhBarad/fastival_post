import 'package:flutter/material.dart';

import 'list.dart';
import 'modal.dart';

Widget Getquotes({required String fas}) {
  return Builder(builder: (context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: quotes
            .map(
              (e) => (e['fastiva'] == fas)
                  ? GestureDetector(
                      onTap: () {
                        Quotes q1 = Quotes(
                          quote: e['quote'],
                          author: e['author'],
                          fastiva: e['fastiva'],
                        );
                        Navigator.of(context)
                            .pushNamed('details', arguments: q1);
                      },
                      child: Container(
                        height: 180,
                        width: 180,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(20),
                        child: Text("${e['quote']}"),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade400,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  : Container(),
            )
            .toList(),
      ),
    );
  });
}
