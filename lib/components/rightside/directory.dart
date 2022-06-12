import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_processor/shares/decorations.dart';

class DirectoryWrapper extends StatelessWidget {
  const DirectoryWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 250,
          height: 250,
          decoration: rightsideBoxDecoration,
          child: const DirectoryView()),
    );
  }
}

class DirectoryView extends StatefulWidget {
  const DirectoryView({Key? key}) : super(key: key);

  @override
  State<DirectoryView> createState() => _DirectoryViewState();
}

List<Widget> widgets = [];

class _DirectoryViewState extends State<DirectoryView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: getAllFiles('images'),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return MaterialButton(onPressed: () {
              print(widgets.length.toString());
            });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return ListView.builder(
              controller: ScrollController(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return DirectoryCard(snapshot.data![index]);
              },
            );
          }
        });
  }
}

class DirectoryCard extends StatelessWidget {
  final String path;
  const DirectoryCard(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(path),
    );
  }
}

Future<List<String>> getAllFiles(String path) async {
  """
  path이하 모든 파일을 탐색해 경로를 String 형 리스트로 반환.
  """;
  List<String> result = [];
  await Directory(path).list().toList().then((list) async {
    for (FileSystemEntity e in list) {
      String type = e.toString().split(':')[0]; // File or Directory
      // "images/asdf.d" if file.
      // "images/asd" if directory
      String name = e.toString().split("'")[1];
      if (type == 'File') {
        print('${name} is added. ');
        result.add(name);
      } else if (type == 'Directory') {
        print('${name} is added. ');
        List<String> smallList = await getAllFiles(name);
        result.addAll(smallList);
      }
    }
  });
  return result;
}

Future<List<String>> getFilesInDirectory(String path) async {
  """
  해당 디렉토리 안의 파일과 폴더명을 String리스트로 출력
  """;
  List<FileSystemEntity> list =
      await Directory(path).list(recursive: true).toList();
  // List<FileSystemEntity> => List<String> 변환
  return list.map((e) => e.toString()).toList();
}
