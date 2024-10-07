import 'package:flutter/material.dart';

class LocalizationService extends ChangeNotifier {
  static Locale _locale = const Locale('en');

  // Initialize the locale
  set currentLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  // Helper function to retrieve the current locale
  Locale get currentLocale => _locale;

  void changeLanguage(String lang) {
    currentLocale = Locale(lang);
  }
}
