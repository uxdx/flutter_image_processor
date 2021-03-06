import 'package:flutter/material.dart';
import 'package:flutter_image_processor/components/rightside/directoryview.dart';
import 'package:flutter_image_processor/components/rightside/outputfield.dart';
import 'package:flutter_image_processor/components/rightside/scrapperGUI.dart';

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [ImageList(), ScrapperGUI()],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                OutputField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
