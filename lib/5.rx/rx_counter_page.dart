import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class RxCounterPage extends StatefulWidget {
  @override
  _RxCounterPageState createState() => _RxCounterPageState();
}

class _RxCounterPageState extends State<RxCounterPage> {
  int _counter = 0;
  final BehaviorSubject<int> _subject = BehaviorSubject<int>();
  @override
  void dispose() {
    _subject.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('rx  Counter')),
      body: Center(
        child: StreamBuilder<int>(
            // 监听Stream，每次值改变的时候，更新Text中的内容
            stream: _subject.stream,
            initialData: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} ');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
          // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
          _subject.sink.add(++_counter);
        },
      ),
    );
  }
}
