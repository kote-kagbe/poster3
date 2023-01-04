import 'package:flutter/material.dart';

class RightDrawer extends StatefulWidget {
  const RightDrawer({super.key});

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Drawer(),
    );
  }
}