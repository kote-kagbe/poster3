import 'dart:async';
import 'package:flutter/material.dart';

import 'package:poster3/intercom.dart' show macrosEditChange;
import 'package:poster3/poster_const.dart';
import 'package:poster3/bl/macros/macros.dart';
import 'package:poster3/bl/macros/macros_item.dart';

class AddToMacrosButton extends StatefulWidget {
  const AddToMacrosButton({super.key});

  @override
  State<AddToMacrosButton> createState() => _AddToMacrosButton();
}

class _AddToMacrosButton extends State<AddToMacrosButton> {
  bool isMacrosEditItem = macros.isEditingMacrosItem();
  StreamSubscription<bool>? macrosEditItemListener;

  @override
  void initState() {
    super.initState();
    macrosEditItemListener ??= macrosEditChange.stream.listen((value) {
      if(mounted) {
        setState(() => isMacrosEditItem = value);
      }
    });
  }

  @override
  void dispose() {
    macrosEditItemListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: glowColor,
            spreadRadius: 0,
            blurRadius: 14,
          ),
        ]
      ),
      child: Stack(
        children: [
          const Text(
            '+',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
          ),
          IconButton(
              onPressed: () => macros.add(MacrosItem()),
              icon: const Icon(Icons.smart_toy_outlined)
          ),

        ]
      )
    );
  }
}