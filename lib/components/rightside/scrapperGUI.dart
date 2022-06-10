import 'package:flutter/material.dart';

class ScrapperGUI extends StatefulWidget {
  const ScrapperGUI({Key? key}) : super(key: key);

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
              Row(children: const [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 11,
                    ),
                    maxLines: 3,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.black
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(left: 4.0,top: 8.0, right: 4.0, bottom: 4.0),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'https://...',
                    ),
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
                    onPressed: () {
                      print('Scrap.');
                    },
                    child: const Icon(Icons.arrow_circle_down)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
