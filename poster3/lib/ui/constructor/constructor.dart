import 'package:flutter/material.dart';

import 'package:poster3/ui/constructor/left_drawer.dart' show LeftDrawer;
import 'package:poster3/ui/constructor/right_drawer.dart' show RightDrawer;
import 'package:poster3/ui/constructor/body.dart' show Body;
import 'package:poster3/ui/constructor/app_bar.dart' show ConstructorAppBar;

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
