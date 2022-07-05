import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reorderable Wrap',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _demoWidgets = <Widget>[];

  void _onReorder(int indexOld, indexNew) {
    Widget w = _demoWidgets.removeAt(indexOld);
    _demoWidgets.insert(indexNew, w);
  }

  Widget _demoWidget() {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 80,
      width: 80,
      color: Colors.blue,
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      _demoWidgets.add(_demoWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget reorderableWrap = ReorderableWrap(
      onReorder: _onReorder,
      children: _demoWidgets,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: reorderableWrap),
    );
  }
}
