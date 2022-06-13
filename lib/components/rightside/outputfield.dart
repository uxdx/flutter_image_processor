import 'package:flutter/material.dart';
import 'package:flutter_image_processor/shares/decorations.dart';

class OutputField extends StatefulWidget {
  const OutputField({Key? key}) : super(key: key);

  @override
  State<OutputField> createState() => _OutputFieldState();
}

class _OutputFieldState extends State<OutputField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 250, maxHeight: 350),
          decoration: rightsideBoxDecoration,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child:  SingleChildScrollView(
              child: TextField(
                readOnly: true,
                minLines: 10,
                maxLines: 10,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      BorderSide(color: Colors.grey, width: 0.0),
                  )
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}