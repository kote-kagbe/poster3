part of 'saby_entity.dart';

class SabyField<T> {
// properties
  T? _value;

// constructors
  SabyField._();

// inner methods

// public methods
  T? get value => this._value;
  set value(T? newValue) => _value = newValue;
  dynamic get sabyValue => this._value;

  static SabyField fromType(SabyFieldType type) {
    switch (type) {
      case SabyFieldType.ftUNKNOWN:
        return SabyField<dynamic>._();

      case SabyFieldType.ftBOOLEAN:
        return SabyField<bool>._();

      case SabyFieldType.ftINT8:
      case SabyFieldType.ftINT16:
      case SabyFieldType.ftINT32:
      case SabyFieldType.ftINT64:
        return SabyField<int>._();

      case SabyFieldType.ftFLOAT:
      case SabyFieldType.ftDOUBLE:
      case SabyFieldType.ftMONEY:
      case SabyFieldType.ftDECIMAL:
        return SabyField<double>._();

      case SabyFieldType.ftTEXT:
      case SabyFieldType.ftSTRING:
        return SabyField<String>._();

      case SabyFieldType.ftDATE:
        return SabyFieldDate._();
      case SabyFieldType.ftTIME:
        return SabyFieldTime._();
      case SabyFieldType.ftDATETIME:
        return SabyFieldDateTime._();
      // case SabyFieldType.ftTIMEINTERVAL:

      // case SabyFieldType.ftBLOB:

      case SabyFieldType.ftRECORD:
        return SabyFieldRecord._();
      case SabyFieldType.ftRECORDSET:
        return SabyFieldRecordset._();

      case SabyFieldType.ftUUID:
        return SabyFieldUuid._();

      case SabyFieldType.ftARRAY_TEXT:
        return SabyArray<String>._();
      case SabyFieldType.ftARRAY_INT16:
      case SabyFieldType.ftARRAY_INT32:
      case SabyFieldType.ftARRAY_INT64:
        return SabyArray<int>._();
      case SabyFieldType.ftARRAY_BOOLEAN:
        return SabyArray<bool>._();
      case SabyFieldType.ftARRAY_MONEY:
      case SabyFieldType.ftARRAY_DECIMAL:
      case SabyFieldType.ftARRAY_FLOAT:
      case SabyFieldType.ftARRAY_DOUBLE:
        return SabyArray<double>._();
      case SabyFieldType.ftARRAY_UUID:
        return SabyArray<String>._();
      case SabyFieldType.ftARRAY_DATE:
      case SabyFieldType.ftARRAY_TIME:
      case SabyFieldType.ftARRAY_DATETIME:
      // case SabyFieldType.ftARRAY_TIMEINTERVAL:

      // case SabyFieldType.ftRPC_FILE:

      case SabyFieldType.ftHASH_TABLE:
        return SabyField<Map<String, dynamic>>._();
    }
  }
}

class SabyFieldDateTime extends SabyField<DateTime> {
  SabyFieldDateTime._() : super._();

  @override
  set value(dynamic newValue) {
    if (newValue == null) {
      _value = null;
    } else if (newValue is String) {
      _value = DateTime.parse(newValue);
    } else if (newValue is DateTime) {
      _value = newValue;
    } else {
      throw Exception('Неверный формат даты');
    }
  }

  @override
  dynamic get sabyValue => _value == null
      ? null
      : DateFormat('yyyy-MM-ddTHH:mm:ssjz').format(_value!);
}

class SabyFieldDate extends SabyFieldDateTime {
  SabyFieldDate._() : super._();

  @override
  dynamic get sabyValue =>
      _value == null ? null : DateFormat('yyyy-MM-dd').format(_value!);
}

class SabyFieldTime extends SabyFieldDateTime {
  SabyFieldTime._() : super._();
  @override
  dynamic get sabyValue =>
      _value == null ? null : DateFormat('HH:mm:ss').format(_value!);
}

class SabyFieldUuid extends SabyField<String> {
  SabyFieldUuid._() : super._();
  @override
  dynamic get sabyValue => _value == null ? null : _value!.toString();
}

class SabyFieldRecord extends SabyField<SabyRecord> {
  SabyFieldRecord._() : super._();
  @override
  dynamic get sabyValue => _value == null ? null : _value!.sabyValue();
}

class SabyFieldRecordset extends SabyField<SabyRecord> {
  SabyFieldRecordset._() : super._();
  @override
  dynamic get sabyValue => _value == null ? null : _value!.sabyValue();
}

class SabyArray<T> extends SabyField<List<T?>> {
  SabyArray._() : super._();

  @override
  set value(List<dynamic>? newValue) {
    if (newValue == null) {
      _value = null;
    } else {
      _value = List.generate(newValue.length, (index) => newValue[index] as T);
    }
  }
}

class SabyFieldArrayDateTime extends SabyArray<DateTime> {
  SabyFieldArrayDateTime._() : super._();

  @override
  set value(List<dynamic>? newValue) {
    if (newValue == null) {
      _value = null;
    } else {
      List<DateTime?>.generate(newValue.length, (index) {
        if (newValue[index] is String) {
          return DateTime.parse(newValue[index]);
        } else if (newValue[index] is DateTime) {
          return newValue[index];
        } else {
          throw Exception('Неверный формат массива дат');
        }
      });
    }
  }

  @override
  dynamic get sabyValue => _value == null
      ? null
      : List.of(value!.map((e) =>
          e == null ? null : DateFormat('yyyy-MM-ddTHH:mm:ssjz').format(e)));
}

class SabyFieldArrayDate extends SabyFieldArrayDateTime {
  SabyFieldArrayDate._() : super._();

  @override
  dynamic get sabyValue => _value == null
      ? null
      : List.of(value!
          .map((e) => e == null ? null : DateFormat('yyyy-MM-dd').format(e)));
}

class SabyFieldArrayTime extends SabyFieldArrayDateTime {
  SabyFieldArrayTime._() : super._();
  @override
  dynamic get sabyValue => _value == null
      ? null
      : List.of(value!
          .map((e) => e == null ? null : DateFormat('HH:mm:ss').format(e)));
}

class SabyFieldArrayUuid extends SabyArray<String> {
  SabyFieldArrayUuid._() : super._();
  @override
  dynamic get sabyValue =>
      _value == null ? null : List.of(value!.map((e) => e?.toString()));
}
