part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  int counterValue;
  bool wasIncremented;

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
        counterValue: map['counterValue'],
        wasIncremented: map['wasIncremented']);
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}
