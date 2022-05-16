import 'package:flutter/material.dart';

import '../../consts.dart' as consts;

class AppBarRow extends AppBar {
  AppBarRow({Key? key})
      : super(
            key: key,
            title: const Padding(
                padding:
                    EdgeInsets.only(bottom: consts.appBarTitleBottomPadding),
                child: Text(consts.appTitle)),
            leading: GestureDetector(
              onTap: () {/* Write listener code here */},
              child: const Icon(
                Icons.menu, // add custom icons also
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      right: consts.appBarRowHorizontalPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      size: 26.0,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      right: consts.appBarRowHorizontalPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.smart_toy_outlined),
                  )),
            ]);
}
