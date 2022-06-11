import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

class ScrapperGUI extends StatefulWidget {
  const ScrapperGUI({Key? key}) : super(key: key);

  void runPythonScript() {}
  @override
  State<ScrapperGUI> createState() => _ScrapperGUIState();
}

class _ScrapperGUIState extends State<ScrapperGUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 250,
          maxHeight: 160,
        ),
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
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) async {},
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                    maxLines: 3,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                            left: 4.0, top: 8.0, right: 4.0, bottom: 4.0),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'URL',
                        hintText: 'https://...'),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      onPressed: () async {
                        // var result =
                            // await Process.run('python', ['lib/py/test.py']);
                        var result = await Process.run('python', ['lib/py/scrapper.py', 'https://nav.com', '//img']);
                        // result.stdout.forEach(print);
                        stdout.write(result.stdout);
                        stderr.write(result.stderr);
                      },
                      child: const Icon(Icons.arrow_circle_down))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
