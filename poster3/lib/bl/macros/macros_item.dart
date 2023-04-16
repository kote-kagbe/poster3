import 'package:poster3/bl/network/proxy.dart';
import 'package:poster3/bl/types/isolatable.dart';

class MacrosItem with Isolatable {
  final proxy = Proxy();
  bool reloadPython = false;
  int protocolVersion = 6;
  bool serviceBL = false;
  String? privateService;
  //SiteInfo
  //Map<String, >

  @override
  dynamic toIsolatable() {

  }

  @override
  void fromIsolatable(dynamic value) {

  }
}