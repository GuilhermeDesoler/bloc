part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  int counterValue;
  bool wasIncremented;

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}
