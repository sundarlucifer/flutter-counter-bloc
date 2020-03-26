part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class AppStarted extends CounterEvent {}

class RefreshCounter extends CounterEvent {}

class IncrementCounter extends CounterEvent {
  final int count;

  const IncrementCounter({@required this.count});
}