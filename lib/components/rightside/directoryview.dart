import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_processor/models/imagemodels.dart';
import 'package:flutter_image_processor/shares/decorations.dart';
import 'package:provider/provider.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250, maxHeight: 350),
        decoration: rightsideBoxDecoration,
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
              onPressed: () {
                context.read<ImageDirectoryModel>().resetCurrentPath();
                context.read<SelectedImageModel>().resetList();
              },
              child: const Icon(Icons.refresh),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount:
                        context.watch<ImageDirectoryModel>().files.length,
                    itemBuilder: (BuildContext context, int index) {
                      FileSystemEntity file =
                          context.watch<ImageDirectoryModel>().files[index];
                      String filename = file
                          .toString()
                          .split("'")[1]
                          .replaceAll(RegExp(r'\\'), '/');
                      // print(filename);
                      bool isDirectory = !filename.contains('.');
                      return ImageCard(
                          filename,
                          context
                              .watch<SelectedImageModel>()
                              .isSelected(filename),
                          isDirectory);
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

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
    return GestureDetector(
      onTap: () {
        if (!isDirectory) {
          SelectedImageModel model = context.read<SelectedImageModel>();
          model.isSelected(imagefile)
              ? model.remove(imagefile)
              : model.add(imagefile);
        }
      },
      child: Padding(
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
              // ????????? ????????????
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () {
                    isDirectory
                        ? context
                            .read<ImageDirectoryModel>()
                            .changeCurrentPath(imagefile)
                        : context
                            .read<LeftSideLargeImageModel>()
                            .changeImagepath(imagefile);
                  },
                  child: isDirectory
                      ? const Center(child: Icon(Icons.folder))
                      : Image.file(File(imagefile)),
                ),
              ),
              const VerticalDivider(
                width: 1,
              ),
              // ????????? ????????????
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
      ),
    );
  }
}
