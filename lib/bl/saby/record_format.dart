part of 'saby_entity.dart';

typedef AddCallback = void Function(
    int fieldPos, String name, SabyFieldType type);
typedef RemoveCallback = void Function(int fieldPos);
typedef FormatFieldsListValue = ({
  String name,
  SabyFieldType sabyFieldType,
  dynamic sabyFormat
});
typedef FormatChangeMessage = ({
  FormatChangeType event,
  int index,
  String name,
  FormatFieldsListValue type
});
typedef FormatFieldsList = List<FormatFieldsListValue>;
typedef FormatIterValue = ({SabyFieldType type, String name});

enum FormatChangeType {
  fctAdd,
  fctRemove,
}

abstract class SabyRecordFormat {
// properties
  final FormatFieldsList _fields;
  final StreamController<FormatChangeMessage> _formatChangeChannel;

// constructors
  SabyRecordFormat._create()
      : _fields = FormatFieldsList.empty(growable: true),
        _formatChangeChannel =
            StreamController<FormatChangeMessage>.broadcast(sync: true);

  SabyRecordFormat._share(SabyRecordFormat newFormat)
      : _fields = newFormat._fields,
        _formatChangeChannel = newFormat._formatChangeChannel;

  SabyRecordFormat._copy(SabyRecordFormat newFormat)
      : _fields = FormatFieldsList.from(newFormat._fields),
        _formatChangeChannel =
            StreamController<FormatChangeMessage>.broadcast(sync: true);

// inner methods

// public methods
  static SabyRecordFormat? parse(dynamic value) {
    if (value is Map && value.containsKey('s')) {
      DeepCollectionEquality eq = const DeepCollectionEquality.unordered();
      final result = SabyRecordFormatOwned();
      for (final format in value['s']) {
        if (format is! Map ||
            !format.containsKey('n') ||
            !format.containsKey('t')) {
          return null;
        }
        final fieldType = SabyFieldType.values.firstWhere(
            (element) => eq.equals(element.format, format['t']),
            orElse: () => SabyFieldType.ftUNKNOWN);
        result.addField(fieldType, format['n'],
            sabyTypeValue:
                fieldType == SabyFieldType.ftUNKNOWN ? format['t'] : null);
      }
      return result;
    } else {
      return null;
    }
  }

  Iterable<FormatIterValue> get fields sync* {
    for (final field in _fields) {
      yield (type: field.sabyFieldType, name: field.name);
    }
  }

  operator [](int index) => _fields[index];

  int get fieldsCount => _fields.length;

  int fieldIndex(String fieldName) {
    final index = _fields.indexWhere((element) => element.name == fieldName);
    if (index > -1) {
      return index;
    } else {
      throw Exception('Поле $fieldName не найдено в формате');
    }
  }

  StreamSubscription<FormatChangeMessage> listen(
      void Function(FormatChangeMessage) callback) {
    return _formatChangeChannel.stream.listen(callback);
  }

  void addField(SabyFieldType type, String fieldName,
      {int? index, dynamic sabyTypeValue});
  void removeField(String fieldName);
}

final class SabyRecordFormatShared extends SabyRecordFormat {
// constructors
  SabyRecordFormatShared.fromFormat(SabyRecordFormat newFormat)
      : super._share(newFormat);

  @override
  void addField(SabyFieldType type, String fieldName,
      {int? index, dynamic sabyTypeValue}) {
    throw Exception('Формат записи нельзя изменять');
  }

  @override
  void removeField(String fieldName) {
    throw Exception('Формат записи нельзя изменять');
  }
}

final class SabyRecordFormatOwned extends SabyRecordFormat {
// constructors
  SabyRecordFormatOwned() : super._create();

  SabyRecordFormatOwned.fromFormat(SabyRecordFormat newFormat)
      : super._copy(newFormat);

// inner methods

// public methods
  @override
  void addField(SabyFieldType type, String fieldName,
      {int? index, dynamic sabyTypeValue}) {
    int exists = _fields
        .indexWhere((element) => element.sabyFieldType.name == fieldName);
    if (exists < 0) {
      _formatChangeChannel.add((
        event: FormatChangeType.fctAdd,
        index: index ?? _fields.length,
        name: fieldName,
        type: (sabyFieldType: type, sabyFormat: sabyTypeValue, name: fieldName),
      ));
      _fields.insert(index ?? _fields.length,
          (sabyFieldType: type, sabyFormat: sabyTypeValue, name: fieldName));
    } else {
      throw Exception(
          'Поле $fieldName уже присутствует в формате и имеет тип ${_fields[exists].sabyFieldType.name}');
    }
  }

  @override
  void removeField(String fieldName) {
    final index = fieldIndex(fieldName);
    if (index >= 0) {
      _formatChangeChannel.add((
        event: FormatChangeType.fctRemove,
        index: index,
        name: fieldName,
        type: _fields[index]
      ));
      _fields.removeAt(index);
    } else {
      throw Exception('Поле $fieldName не существует в формате');
    }
  }
}
