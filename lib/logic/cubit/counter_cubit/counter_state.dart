part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  final bool? isReset;
  CounterState({required this.counterValue, this.isReset});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }
}
