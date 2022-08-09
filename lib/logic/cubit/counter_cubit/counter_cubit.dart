import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin{
  CounterCubit() : super(CounterState(counterValue: 0));
  int _last = 0;

  void undoReset() => emit(CounterState(counterValue: _last));
  void reset() => emit(CounterState(counterValue: 0, isReset: true));
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    _last = change.currentState.counterValue;
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
      return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
