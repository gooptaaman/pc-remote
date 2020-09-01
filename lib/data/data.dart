import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data with ChangeNotifier {
  final String key = 'settings';
  List<String> _settingsList;
  SharedPreferences _prefs;

  List<String> get getSettings => _settingsList;

  Data() {
    _settingsList = [
      'null',
      'null',
      'null',
    ];
    _loadFromPrefs();
  }

  changeSettings(list) {
    _settingsList = list;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _settingsList = _prefs.getStringList('settings');
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setStringList(key, _settingsList);
  }
}
