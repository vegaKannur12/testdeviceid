import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tesdeviceid/flutter_layout_grid-example.dart';
import 'package:tesdeviceid/gmappgm.dart';
import 'package:tesdeviceid/imageSize.dart';
import 'package:tesdeviceid/mapSample.dart';
import 'package:tesdeviceid/test.dart';

// import 'package:window_size/window_size.dart';
import 'gridsample.dart';
import 'valueListenExample/homepage.dart';

// import 'package:tesdeviceid/vluenotifierpgm.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isWindows) {
  //   setWindowMaxSize(const Size(1024, 768));
  //   setWindowMinSize(const Size(512, 384));
  // }
  final prefs = await SharedPreferences.getInstance();
  var idfetch = await prefs.getString('action');
  runApp(MyApp(
    id: idfetch,
  ));
}

class MyApp extends StatefulWidget {
  String? id;
  MyApp({this.id});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
      // home:widget.id==null?Sharedpgm():Home(),
    );
  }
}
