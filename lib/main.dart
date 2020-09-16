import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    testLoadJsonFile();
    // testLoadJsonFileByDefaultAssetBundle(context);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

void testLoadJsonFile() {
  debugPrint("begin load");
  parseJson().then((value) => print("value: $value"));
  debugPrint("end load");
}

void testLoadJsonFileByDefaultAssetBundle(BuildContext context) {
  // This is not work too.
  DefaultAssetBundle.of(context)
      .loadString('json_test_package/assets/test2.jso');
}

// ignore: unused_element
Future<String> _loadFromPackageAsset() async {
  // json file in package,is not work
  return rootBundle.loadString("json_test_package/assets/test2.json");
}

// ignore: unused_element
Future<String> _loadFromProjectAsset() async {
  // json file in project,is ok
  return rootBundle.loadString("assets/test1.json");
}

// use this method to test
Future<Map> parseJson() async {
  final String jsonString = await _loadFromPackageAsset();
  // final String jsonString = await _loadFromProjectAsset();
  final jsonResponse = jsonDecode(jsonString);
  return jsonResponse;
}
