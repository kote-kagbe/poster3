import 'package:flutter/material.dart';

import 'auth_row.dart';
import 'app_bar_row.dart';
import 'method_row.dart';

class ContructorScreen extends StatefulWidget {
  const ContructorScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<ContructorScreen> createState() => _ContructorScreenState();
}

class _ContructorScreenState extends State<ContructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarRow(),
        body: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                AuthRow(),
                Divider(),
                MethodRow(),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Выполнить запрос',
          child: const Icon(Icons.wifi_rounded),
        ));
  }
}
