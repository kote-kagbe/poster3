import 'package:poster3/bl/network/proxy.dart';
import 'package:poster3/bl/types/isolatable.dart';

class MacrosItem with Isolatable {
  String name = '';
  final proxy = Proxy();
  bool reloadPython = false;
  int protocolVersion = 6;
  bool serviceBL = false;
  String? privateService;
  //SiteInfo
  //Map<String, >

  @override
  IsolatableResult toIsolatable() {
    return IsolatableResult(key: '1', value: 1);
  }

  @override
  void fromIsolatable(dynamic value) {

  }
}