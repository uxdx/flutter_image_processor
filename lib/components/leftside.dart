import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_processor/models/viewimage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({Key? key}) : super(key: key);

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<ViewImage>(
      builder: ((context, value, child) => PhotoView(
            imageProvider: FileImage(File(value.imagepath)),
          )),
    ));
  }
}