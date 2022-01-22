part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool wasIncremented = false;

  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';
}
