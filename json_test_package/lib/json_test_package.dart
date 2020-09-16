library json_test_package;

import 'dart:convert';

import 'package:flutter/services.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

main(List<String> args) {
  parseJson().then((value) => print("value: $value"));
}

Future<String> _loadFromAsset() async {
  return rootBundle.loadString("assets/test2.json");
}

Future<Map> parseJson() async {
  final String jsonString = await _loadFromAsset();
  final jsonResponse = jsonDecode(jsonString);
  return jsonResponse;
}
