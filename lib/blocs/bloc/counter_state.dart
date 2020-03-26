part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class CounterInitial extends CounterState {}

class CounterRunning extends CounterState {
  final int count;

  const CounterRunning({@required this.count});
}
