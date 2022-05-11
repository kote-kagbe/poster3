import 'dart:io';
// import 'package:bitsdojo_window/bitsdojo_window.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'package:flutter/material.dart';
import 'screens/constructor/constructor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // await DesktopWindow.setWindowSize(Size(500, 300));
    var window = await window_size.getWindowInfo();
    var screen = window.screen;
    if (screen != null) {
      final screenFrame = screen.visibleFrame;
      //TODO
      const width = 1000.0;
      const height = 1100.0;
      final left = ((screenFrame.width - width) / 2).roundToDouble();
      final top = ((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      window_size.setWindowFrame(frame);
      window_size.setWindowMinSize(const Size(860, 900));
    }
    // setWindowMinSize(const Size(860, 900));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSTer 3',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const ContructorScreen(),
    );
  }
}
