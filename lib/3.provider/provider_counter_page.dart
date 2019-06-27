import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => CounterModel()),
      ],
      child: CounterPage(),
    );
    return ChangeNotifierProvider(
        builder: (context) => CounterModel(), child: CounterPage());
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider  Counter App')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel model, Widget child) {
            return Text('You hit me: ${model.counter} ');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<CounterModel>(context).increment();
        },
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
