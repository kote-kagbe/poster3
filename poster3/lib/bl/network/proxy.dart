import 'package:poster3/bl/types/isolatable.dart';
import 'package:poster3/bl/types/pair.dart';

class Proxy with Isolatable {
  final _path = Pair<String, String>(key: 'path', value: null);
  final _port = Pair<String, int>(key: 'port', value: null);
  final _user = Pair<String, String>(key: 'user', value: null);
  final _password = Pair<String, String>(key: 'password', value: null);

  static const placeholder = 'proxy';

  String? get path => _path.value;
  set path(String? newValue) => _path.value = newValue;

  int? get port => _port.value;
  set port(int? newValue) => _port.value = newValue;

  String? get user => _user.value;
  set user(String? newValue) => _user.value = newValue;

  String? get password => _password.value;
  set password(String? newValue) => _password.value = newValue;

  @override
  Pair<String, dynamic> toIsolatable() {
    return Pair(key: placeholder, value: {
      _path.key: path,
      _port.key: port,
      _user.key: user,
      _password.key: password,
    });
  }

  @override
  void fromIsolatable(dynamic value) {
    final map = value != null ? value as Map<String, dynamic> : null;
    path = map?[placeholder]?[_path.key];
    port = map?[placeholder]?[_port.key];
  }
}