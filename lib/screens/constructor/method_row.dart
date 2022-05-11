import 'package:flutter/material.dart';

import '../../consts.dart' as consts;

class MethodRow extends StatefulWidget {
  const MethodRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MethodRowState();
}

class _MethodRowState extends State<MethodRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: consts.rowHorizontalPadding),
            child:
                IconButton(onPressed: () => {}, icon: const Icon(Icons.abc))),
        const Expanded(
          child: TextField(
              decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Имя метода',
          )),
        ),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: consts.rowHorizontalPadding),
            child: IconButton(onPressed: () => {}, icon: const Icon(Icons.abc)))
      ],
    );
  }
}
