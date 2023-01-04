import 'package:flutter/material.dart';

import 'package:flutter_treeview/flutter_treeview.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TreeViewController _treeViewController = TreeViewController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TreeView(controller: _treeViewController)
          ],
        ),
      );
  }
}