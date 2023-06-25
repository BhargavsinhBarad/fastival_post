import 'dart:io';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/list.dart';
import '../utils/modal.dart';
import '../utils/widget.dart';

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  bool isToggle = false;
  Color mycolor = Colors.black;
  Color backcolor = Colors.blueGrey.shade300;
  String backimg = "";
  String fonts = "Roboto";

  void ShareImage() async {
    RenderRepaintBoundary bountry = await imagekey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    var image = await bountry.toImage(pixelRatio: 2);

    var bit = await image.toByteData(format: ImageByteFormat.png);

    var uList = await bit!.buffer.asInt8List();

    Directory directory = await getApplicationDocumentsDirectory();

    File file = await File("${directory.path}.png").create();
    await file.writeAsBytes(uList);

    Share.shareXFiles([XFile(file.path)]);
  }

  GlobalKey imagekey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Quotes data = ModalRoute.of(context)!.settings.arguments as Quotes;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          data.fastiva,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  mycolor = Colors.black;
                  backcolor = Colors.blueGrey.shade300;
                  backimg = "";
                  fonts = "Roboto";
                  isToggle = false;
                });
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                setState(() {
                  ShareImage();
                });
              },
              icon: const Icon(Icons.share)),
        ],
      ),
      floatingActionButton: Container(
        child: IconButton(
            onPressed: () {
              setState(() {
                isToggle = !isToggle;
              });
            },
            icon: const Icon(Icons.edit)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          RepaintBoundary(
            key: imagekey,
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 250,
              width: 250,
              child: Center(
                child: Text(
                  data.quote,
                  style: GoogleFonts.getFont(fonts).merge(
                    TextStyle(color: mycolor, fontSize: 23),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                  color: backcolor,
                  image: DecorationImage(
                    image: AssetImage(backimg),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isToggle
              ? Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "Font Color",
                          style: TextStyle(color: Colors.black),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Colors.primaries
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          mycolor = e;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(3),
                                        height: 45,
                                        width: 50,
                                        color: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const Text(
                          "Backbgroud Color",
                          style: TextStyle(color: Colors.black),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Colors.primaries
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          backcolor = e;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(3),
                                        height: 45,
                                        width: 50,
                                        color: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const Text(
                          "Background Image",
                          style: TextStyle(color: Colors.black),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: image
                                .map(
                                  (e) => (e['fastiva'] == data.fastiva)
                                      ? Row(
                                          children: [
                                            Builder(builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    backimg = e['img'];
                                                  });
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            e['img']),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              );
                                            }),
                                          ],
                                        )
                                      : Container(),
                                )
                                .toList(),
                          ),
                        ),
                        Text(
                          "Fonts",
                          style: TextStyle(color: Colors.black),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: font
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        fonts = e;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      margin: EdgeInsets.all(10),
                                      child: Center(
                                          child: Text(
                                        e,
                                        style: TextStyle(fontSize: 10),
                                      )),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
