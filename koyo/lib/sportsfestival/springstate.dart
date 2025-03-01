import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DataStorage {
  // データの保存
  static Future<void> saveData(List<Color> springDataIconColor) async {
    final prefs = await SharedPreferences.getInstance();


    
    List<String> colorStrings = springDataIconColor
        .map((color) => color.value.toRadixString(16))  // 色を16進数の文字列に変換
        .toList();
    await prefs.setStringList('springDataIconColor', colorStrings);  // SharedPreferencesに保存
  }

  // データの読み込み
  static Future<List<Color>> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? colorStrings = prefs.getStringList('springDataIconColor');
    
    if (colorStrings != null) {
      return colorStrings
          .map((colorString) => Color(int.parse(colorString, radix: 16)))
          .toList();
    } else {
      return [];  // データがない場合は空のリストを返す
    }
  }

static Future<void> saveDataresult(List<int> springDataResult) async {
  final prefs = await SharedPreferences.getInstance();
  // 整数のリストを保存する
  await prefs.setStringList(
    'springDataresult',
    springDataResult.map((e) => e.toString()).toList(),
  );
}
}