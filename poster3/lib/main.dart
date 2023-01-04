import 'package:flutter/material.dart';

import 'package:poster3/poster_const.dart' show posterTitle;
import 'package:poster3/ui/constructor/constructor.dart';

void main() {
  runApp(const PosterApp());
}

class PosterApp extends StatelessWidget {
  const PosterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: posterTitle,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Constructor(),
    );
  }
}