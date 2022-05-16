import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../consts.dart' as consts;

class AuthRow extends StatefulWidget {
  const AuthRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthRowState();
}

class _AuthRowState extends State {
  bool _status = false;
  String _value = 'dev-online';
  var _items = <String>[
    'dev-online',
    'pre-test-online',
    'test-online',
    'rc-online',
    'fix-online',
    'online'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: consts.rowHorizontalPadding),
          child: IntrinsicWidth(
              child: DropdownButton<String>(
            value: _value,
            items: _items,
            onChanged: (String? newValue) {
              setState(() {
                _value = newValue!;
                _items.add(DropdownMenuItem<String>(
                    value: newValue + newValue,
                    child: Text(newValue + newValue)));
              });
            },
          ))),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Имя пользователя',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Пароль',
            ),
          )
        ],
      )),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: consts.rowHorizontalPadding),
          child: FlutterSwitch(
              value: _status,
              onToggle: (val) {
                setState(() {
                  _status = val;
                });
              },
              activeIcon: const Icon(Icons.security_rounded),
              inactiveIcon: const Icon(Icons.man_rounded))),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: consts.rowHorizontalPadding),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 350),
            child: const IntrinsicWidth(
              child: TextField(
                  maxLength: 39,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    hintText: 'SSID',
                  )),
            ),
          ))
    ]);
  }
}
