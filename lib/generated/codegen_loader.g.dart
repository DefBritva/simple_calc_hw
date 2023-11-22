// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "title": "Simple tips calc",
    "amount": "Amount (\$)",
    "tips": "Tips percent",
    "reset": "reset",
    "calculate": "Calculate",
    "total_tip": "Total tips amount",
    "currency": "\$",
    "language": "language",
    "custom_percents": "custom percents",
    "default_percents": "default percents",
    "enter_small_percent": "Enter small percent",
    "enter_medium_percent": "Enter medium percent",
    "enter_large_percent": "Enter large percent",
    "savePercents": "save percents",
    "incorrectInput": "error incorrect input"
  };
  static const Map<String, dynamic> ru = {
    "title": "Калькулятор чаевых",
    "amount": "Сумма счёта (руб)",
    "tips": "Размер чаевых",
    "reset": "сброс",
    "calculate": "Рассчитать",
    "total_tip": "Итоговая сумма",
    "currency": "руб",
    "language": "Язык",
    "custom_percents": "Персональные проценты",
    "default_percents": "Стандартные проценты",
    "enter_small_percent": "Введите небольшой процент",
    "enter_medium_percent": "Введите средний процент",
    "enter_large_percent": "Введите большой процент",
    "savePercents": "сохранить",
    "incorrectInput": "Ошибка. некорректный ввод"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "ru": ru
  };
}
