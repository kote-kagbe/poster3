import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

enum AppState {
  initFolders(Icons.wifi_1_bar_rounded),
  initFiles(Icons.wifi_2_bar_rounded),
  initGithub(Icons.wifi_rounded),
  main(),
  constructor(),
  response(),
  error(),
  ;

  final IconData? icon;
  const AppState([this.icon]);
}

final appChannel = StreamController<AppState>.broadcast(sync: true);
