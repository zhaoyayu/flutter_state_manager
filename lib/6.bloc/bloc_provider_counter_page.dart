import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_state_manager/6.bloc/provider/bloc_provider.dart';
import 'counter_bloc.dart';

class BlocProviderCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: BlocProvider<CounterBloc>(
        bloc: CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BlocProvider Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            // StreamBuilder控件中没有任何处理业务逻辑的代码
            stream: BlocProvider.of<CounterBloc>(context).counterStream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} ');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<CounterBloc>(context).increment();
        },
      ),
    );
  }

  void dispose() {
    BlocProvider.of<CounterBloc>(context).dispose();
    super.dispose();
  }
}
