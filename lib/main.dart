import 'package:flutter/material.dart';
import 'package:flutter_image_processor/components/leftside.dart';
import 'package:flutter_image_processor/components/rightside.dart';
import 'package:flutter_image_processor/models/viewimage.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ViewImage())],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ViewImage>(
          create: (_) => ViewImage(), 
          child: const Scaffold(
            body: MainPage(),)),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(children: const [
        LeftSide(),
        VerticalDivider(),
        RightSide(),
      ]),
    );
  }
}





