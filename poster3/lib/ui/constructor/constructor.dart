import 'package:flutter/material.dart';

import 'left_drawer.dart' show LeftDrawer;
import 'right_drawer.dart' show RightDrawer;
import 'body.dart' show Body;
import 'app_bar.dart' show ConstructorAppBar;

class Constructor extends StatefulWidget {
  const Constructor({super.key});

  @override
  State<Constructor> createState() => _ConstructorState();
}

class _ConstructorState extends State<Constructor> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstructorAppBar(),
      drawer: LeftDrawer(),
      endDrawer: RightDrawer(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        tooltip: 'Execute',
        child: const Icon(Icons.wifi_rounded),
      ),
    );
  }
}
