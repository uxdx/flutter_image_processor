import 'package:flutter/material.dart';

BoxDecoration rightsideBoxDecoration = BoxDecoration(
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
    ]
);
