import 'package:flutter/material.dart';
import '3.provider/provider_counter_page.dart';
import '4.stream/stream_counter_page.dart';
import '5.rx/rx_counter_page.dart';
import '6.bloc/bloc_counter_page.dart';
import '6.bloc/bloc_provider_counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StreamCounterPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Center(
        child: Text('You hit me: $_counter '),
//        child: innerWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//class innerWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Text('You hit me: $_counter ');
//  }
//}
