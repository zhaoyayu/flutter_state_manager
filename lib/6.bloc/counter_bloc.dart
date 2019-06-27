import 'dart:async';

import 'package:flutter_state_manager/6.bloc/provider/bloc_provider.dart';

class CounterBloc implements BlocBase {
  int count = 0;

  // 处理counter的stream
  StreamController<int> counterController = StreamController<int>();

  StreamSink<int> get counterSink => counterController.sink;

  Stream<int> get counterStream => counterController.stream;

  void dispose() {
    counterController.close();
  }

  void increment() {
    counterSink.add(++count);
  }
}
