import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: ScopedModel<CounterModel>(
      model: CounterModel(),
      child: CounterPage(),
    ));
  }
}
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoped  Counter App')),
      body: Center(
        child: ScopedModelDescendant<CounterModel>(
          builder: (BuildContext context, Widget child, CounterModel model) {
            return Text('You hit me: ${model.counter} ');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ScopedModel.of<CounterModel>(context).increment();
        },
      ),
    );
  }
}
class CounterModel extends Model {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}
