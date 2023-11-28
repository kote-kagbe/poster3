part of 'saby_entity.dart';

enum SabyFieldType {
  ftUNKNOWN(''),

  ftBOOLEAN('Логическое'),

  ftINT64('Число целое'),
  ftINT32('Число целое'),
  ftINT16('Число целое'),
  ftINT8('Число целое'),

  ftFLOAT('Число вещественное'),
  ftDOUBLE('Число вещественное'),

  ftMONEY({"n": "Деньги", "p": 2}),
  ftDECIMAL({"n": "Деньги", "p": 2}),

  ftTEXT("Строка"),
  ftSTRING("Строка"),

  // {
  //   "n": "ftFLAGS",
  //   "t": {
  //     "n": "Флаги",
  //     "s": {

  //     },
  //     "sl": {

  //     }
  //   }
  // },
  // {
  //   "n": "ftFLAGSMASK",
  //   "t": "Маска флагов"
  // },
  // {
  //   "n": "ftENUM",
  //   "t": {
  //     "n": "Перечисляемое",
  //     "s": {
  //       "null": null
  //     },
  //     "sl": {
  //       "null": null
  //     }
  //   }
  // },

  ftDATE("Дата"),
  ftTIME("Время"),
  ftDATETIME("Дата и время"),
  // ftTIMEINTERVAL("Временной интервал"),

  // {
  //   "n": "ftBINARY",
  //   "t": "Двоичное"
  // },
  // ftBLOB("Файл"),

  ftRECORD("Запись"),
  ftRECORDSET("Выборка"),

  // {
  //   "n": "ftLINK_N_to_1",
  //   "t": {
  //     "n": "Связь",
  //     "t": ""
  //   }
  // },

  ftUUID("UUID"),

  // {
  //   "n": "ftXML",
  //   "t": "XML"
  // },

  ftARRAY_INT64({"n": "Массив", "t": "Число целое"}),
  ftARRAY_TEXT({"n": "Массив", "t": "Текст"}),
  ftARRAY_INT16({"n": "Массив", "t": "Число целое"}),
  ftARRAY_INT32({"n": "Массив", "t": "Число целое"}),
  ftARRAY_BOOLEAN({"n": "Массив", "t": "Логическое"}),
  ftARRAY_MONEY({"n": "Массив", "t": "Деньги", "p": -1}),
  ftARRAY_DECIMAL({"n": "Массив", "t": "Деньги", "p": -1}),
  ftARRAY_UUID({"n": "Массив", "t": "UUID"}),
  ftARRAY_DATE({"n": "Массив", "t": "Дата"}),
  ftARRAY_TIME({"n": "Массив", "t": "Время"}),
  ftARRAY_DATETIME({"n": "Массив", "t": "Дата и время"}),
  // ftARRAY_TIMEINTERVAL({"n": "Массив", "t": "Временной интервал"}),
  ftARRAY_FLOAT({"n": "Массив", "t": "Число вещественное"}),
  ftARRAY_DOUBLE({"n": "Массив", "t": "Число вещественное"}),
  // {
  //   "n": "ftIDENTIFIER",
  //   "t": "Идентификатор"
  // },
  // ftRPC_FILE("Файл-rpc"),
  // {
  //   "n": "ftSORTING",
  //   "t": "Выборка"
  // },
  // {
  //   "n": "ftNAVIGATION",
  //   "t": "Запись"
  // },
  ftHASH_TABLE("JSON-объект"),
  ;

  final dynamic format;
  const SabyFieldType(this.format);
}
