part of 'saby_entity.dart';

const recordsetFormatMark = 'recordset';

class SabyRecordset {
// properties
  final SabyRecordFormat _format;
  final List<SabyRecord> _rows = List<SabyRecord>.empty(growable: true);

// constructors
  SabyRecordset({SabyRecordFormat? ownFormat})
      : _format = ownFormat ?? SabyRecordFormatOwned();

  SabyRecordset.fromFormat(SabyRecordFormat newFormat)
      : _format = SabyRecordFormatOwned.fromFormat(newFormat);

  SabyRecordset.withFormat(SabyRecordFormat newFormat)
      : _format = SabyRecordFormatShared.fromFormat(newFormat);

// inner methods

// public methods
  static SabyRecordset? parse(dynamic value) {
    if (value is Map &&
            value['_type'] == recordsetFormatMark &&
            value['d'] is List && // данные - массив массивов
            value['s'] is List // формат
        ) {
      final format = SabyRecordFormat.parse(value);
      if (format == null) {
        return null;
      }
      final result = SabyRecordset(ownFormat: format);
      for (final List values in value['d']) {
        final row = result.addRow();
        for (final (fieldIndex, value) in values.indexed) {
          final format = result.format[fieldIndex];
          row[format.name] = switch (format.sabyFieldType) {
            SabyFieldType.ftRECORD => SabyRecord.parse(value),
            SabyFieldType.ftRECORDSET => SabyRecordset.parse(value),
            _ => value
          };
        }
      }
      return result;
    } else {
      return null;
    }
  }

  Iterable<SabyRecord> get rows sync* {
    for (final record in _rows) {
      yield record;
    }
  }

  SabyRecordFormat get format => _format;

  operator [](int index) => _rows[index];
  operator []=(int index, SabyRecord newValue) {
    _rows[index].dispose(); // ???
    _rows[index] = newValue;
  }

  SabyRecord addRow() {
    final result = SabyRecord.withFormat(_format);
    _rows.add(result);
    return result;
  }

  Map<String, dynamic> sabyValue() => {
        'd': List.generate(
            _rows.length,
            (rowIndex) => List.generate(
                _format.fieldsCount,
                (fieldIndex) =>
                    _rows[rowIndex].field(_format[fieldIndex].name).sabyValue),
            growable: false),
        's': List.generate(
            _format.fieldsCount,
            (index) => {
                  'n': _format[index].name,
                  't': _format[index].sabyFormat ??
                      _format[index].sabyFieldType.format
                },
            growable: false),
        '_type': recordsetFormatMark,
      };
}
