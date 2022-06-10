import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_processor/components/rightside/imagecard.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List file = [];
  List<bool> fileIsSeleted = [];
  void _fileRefresh() async {
    setState(() {
      file = Directory("assets\\")
          .listSync(); //use your folder name insted of resume.
    });
  }

  // void updateFileIsSeleted() {
  //   fileIsSeleted = List<bool>.filled(file.length, false);
  //   for (var f in file) {
      
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _fileRefresh();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250, maxHeight: 350),
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black45),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              minWidth: 30,
              height: 40,
              highlightElevation: 0.0,
              focusElevation: 0.0,
              elevation: 0.0,
              hoverElevation: 0.0,
              color: Colors.white70,
              onPressed: (() {
                setState(() {
                  _fileRefresh();
                });
              }),
              child: const Icon(Icons.refresh),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: file.length,
                    itemBuilder: (BuildContext context, int index) {
                      String filename = file[index]
                          .toString()
                          .split("'")[1]
                          .replaceAll(RegExp(r'\\'), '/');
                      // print(filename);
                      return ImageCard(filename, false);
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
