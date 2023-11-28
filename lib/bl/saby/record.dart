part of 'saby_entity.dart';

const recordFormatMark = 'record';

class SabyRecord {
// properties
  static final Finalizer<StreamSubscription<FormatChangeMessage>> _finalizer =
      Finalizer((listener) => listener.cancel());
  final SabyRecordFormat _format;
  late final List<SabyField> _data; // = List<SabyField>.empty(growable: true);
  late final StreamSubscription<FormatChangeMessage> _formatChangeListener;

// constructors
  SabyRecord({SabyRecordFormat? ownFormat})
      : _format = ownFormat ?? SabyRecordFormatOwned() {
    _init();
  }

  SabyRecord.fromFormat(SabyRecordFormat newFormat)
      : _format = SabyRecordFormatOwned.fromFormat(newFormat) {
    _init();
  }

  SabyRecord.withFormat(SabyRecordFormat newFormat)
      : _format = SabyRecordFormatShared.fromFormat(newFormat) {
    _init();
  }

// inner methods
  void _init() {
    _formatChangeListener = _format.listen(_formatChangeCallback);
    _finalizer.attach(this, _formatChangeListener, detach: this);
    _data = List<SabyField>.generate(_format.fieldsCount,
        (index) => SabyField.fromType(_format[index].sabyFieldType));
  }

  void _formatChangeCallback(FormatChangeMessage message) {
    if (message.name.isNotEmpty) {
      switch (message.event) {
        case FormatChangeType.fctAdd:
          _data.insert(
              message.index, SabyField.fromType(message.type.sabyFieldType));
        case FormatChangeType.fctRemove:
          _data.removeAt(message.index);
      }
    } else {
      throw Exception('Не задано имя для добавления поля');
    }
  }

// public methods
  static SabyRecord? parse(dynamic value) {
    if (value is Map &&
        value['_type'] == recordFormatMark &&
        value['d'] is List && // данные
        value['s'] is List && // формат
        value['d'].length == value['s'].length) {
      final format = SabyRecordFormat.parse(value);
      if (format == null) {
        return null;
      }
      final result = SabyRecord(ownFormat: format);
      for (final (index, field) in format.fields.indexed) {
        result[field.name] = switch (field.type) {
          SabyFieldType.ftRECORD => SabyRecord.parse(value['d'][index]),
          SabyFieldType.ftRECORDSET => SabyRecordset.parse(value['d'][index]),
          _ => value['d'][index]
        };
      }
      return result;
    } else {
      return null;
    }
  }

  SabyRecordFormat get format => _format;

  operator [](String fieldName) {
    final idx = _format.fieldIndex(fieldName);
    if (idx >= 0) {
      return _data[_format.fieldIndex(fieldName)].value;
    } else {
      throw Exception('Поле $fieldName не найдено в формате');
    }
  }

  operator []=(String fieldName, dynamic newValue) {
    final idx = _format.fieldIndex(fieldName);
    if (idx >= 0) {
      _data[_format.fieldIndex(fieldName)].value = newValue;
    } else {
      throw Exception('Поле $fieldName не найдено в формате');
    }
  }

  SabyField field(String fieldName) {
    final index = _format.fieldIndex(fieldName);
    if (index >= 0) {
      return _data[index];
    } else {
      throw Exception('Поле $fieldName не найдено в формате');
    }
  }

  Map<String, dynamic> sabyValue() => {
        'd': List.generate(
            _format.fieldsCount, (index) => _data[index].sabyValue,
            growable: false),
        's': List.generate(
            _format.fieldsCount,
            (index) => {
                  'n': _format[index].name,
                  't': _format[index].sabyFormat ??
                      _format[index].sabyFieldType.format
                },
            growable: false),
        '_type': recordFormatMark,
      };

  void dispose() {
    _formatChangeListener.cancel();
    _finalizer.detach(this);
  }
}
