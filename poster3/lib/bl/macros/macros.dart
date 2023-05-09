import 'package:poster3/bl/macros/macros_item.dart';
import 'package:poster3/bl/types/isolatable.dart';
import 'package:poster3/bl/types/pair.dart';
import 'package:poster3/intercom.dart' show macrosCountChange,
                                            macrosEditChange,
                                            macrosChange;

class Macros with Isolatable {
  final _list = <MacrosItem>[];
  MacrosItem _currentItem = MacrosItem();
  MacrosItem? _currentMacrosItem;

  MacrosItem get currentItem => _currentMacrosItem ?? _currentItem;

  int count() => _list.length;

  void add(MacrosItem item) {
    _list.add(item);
    macrosCountChange.add(_list.length);
  }

  void clear() {
    _list.clear();
    macrosCountChange.add(0);
  }

  void move(int from, int to) {
    final element = _list[from];
    _list.removeAt(from);
    _list.insert(to, element);
    macrosChange.add(true);
  }

  List<Pair<String, String>> names() {
    final result = <Pair<String, String>>[];
    if (_list.isNotEmpty) {
      for(int n = 0; n < _list.length; n++){
        result.add(Pair(key: '${n+1}: ${_list[n].name}', value: '???'));
      }
    }
    return result;
  }

  void setCurrentItemFromMacros(int n) {
    _currentMacrosItem = _list[n];
    macrosEditChange.add(true);
  }

  void setCurrentItemFromItem(MacrosItem item) {
    _currentMacrosItem = null;
    _currentItem = item;
    macrosEditChange.add(false);
  }

  bool isEditingMacrosItem() {
    return _currentMacrosItem != null;
  }

  @override
  IsolatableResult toIsolatable() {
    return IsolatableResult(key: '1', value: 1);
  }

  @override
  void fromIsolatable(dynamic value) {

  }
}

final macros = Macros();