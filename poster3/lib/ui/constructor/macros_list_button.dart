import 'dart:async';
import 'package:flutter/material.dart';

import 'package:poster3/intercom.dart' show macrosCountChange;
import 'package:poster3/poster_const.dart';
import 'package:poster3/bl/macros/macros.dart';

class MacrosListButton extends StatefulWidget {
  const MacrosListButton({super.key});

  @override
  State<MacrosListButton> createState() => _MacrosListButton();
}

class _MacrosListButton extends State<MacrosListButton> {
  int macrosSize = 0;
  late StreamSubscription<int> macrosCountListener;

  @override
  void initState() {
    super.initState();
    macrosCountListener = macrosCountChange.stream.listen((newSize) {
      if(mounted) {
        setState(() => macrosSize = newSize);
      }
    });
  }

  @override
  void dispose() {
    macrosCountListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stack = <Widget>[
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: InkResponse(
          borderRadius: BorderRadius.circular(80.0),
          onTap: () => Scaffold.of(context).openEndDrawer(),
          onSecondaryTap: () => macros.clear(),
          child: const SizedBox(
            height: 50,
            width: 50,
            child: Icon(Icons.smart_toy_outlined)
          ),
        )
      ),
    ];

    if(macrosSize > 0) {
      stack.insert(0,
        Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            shadows: [
              BoxShadow(
                color: glowColor,
                spreadRadius: defaultPadding,
                blurRadius: defaultPadding,
              )
            ],
            color: glowColor,
          ),
          margin: const EdgeInsets.only(left: 4),
          child: Text('$macrosSize'),
        )
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: defaultPadding, right: defaultPadding),
      child: Stack(
        children: stack,
      )
    );
  }
}