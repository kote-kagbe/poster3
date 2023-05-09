import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

import 'package:poster3/ui/constructor/method_name_field.dart' show MethodNameField;
import 'package:poster3/bl/macros/macros.dart';
import 'package:poster3/bl/macros/macros_item.dart';
import 'package:poster3/ui/constructor/add_to_macros_btn.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TreeViewController _treeViewController = TreeViewController(
    children: defaultConstructorNodes,
    // selectedKey: rootNodeID
  );

  final TextEditingController _methodNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                child: MethodNameField(),
              )
            ),
            IconButton(
              onPressed: () => macros.setCurrentItemFromItem(MacrosItem()),
              icon: const Icon(Icons.note_outlined)
            ),
            AddToMacrosButton(),
          ]
        ),
        Expanded(
          child: TreeView(controller: _treeViewController)
        )
      ]
    );
  }
}

const rootNodeID = 'root';
const defaultConstructorNodes = [
  Node(key: rootNodeID, label: 'Аргументы'),
];