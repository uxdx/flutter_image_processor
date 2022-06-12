import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_processor/models/viewimage.dart';
import 'package:provider/provider.dart';

class ImageCard extends StatelessWidget {
  final String imagefile;
  final bool isSelected;
  final bool isDirectory;

  const ImageCard(this.imagefile, this.isSelected, this.isDirectory, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(
                      color: Colors.blue, width: 2.0, style: BorderStyle.solid)
                  : null,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              ]),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지 컨테이너
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () {
                    isDirectory ? context.read<CurrentPath>().changeCurrentPath(imagefile)
                    :context.read<ViewImage>().changeImagepath(imagefile);
                  },
                  child: isDirectory
                      ? const Center(child: Icon(Icons.folder))
                      : Image.file(File(imagefile)),
                ),
              ),
              const VerticalDivider(
                width: 1,
              ),
              // 텍스트 컨테이너
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    imagefile,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                ),
              )
            ],
          ),
        ),
      
    );
  }
}
