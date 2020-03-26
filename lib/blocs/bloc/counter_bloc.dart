import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterInitial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is AppStarted) {
      yield* _getNewCounter();
    } else if (event is RefreshCounter) {
      yield* _getNewCounter();
    } else if (event is IncrementCounter) {
      yield* _getIncrementedCounter(event);
    }
  }

  Stream<CounterState> _getNewCounter() async* {
    yield CounterInitial();
  }

  Stream<CounterState> _getIncrementedCounter(IncrementCounter event) async* {
    yield CounterRunning(count: event.count+1);
  }
}
