import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_state_management_bloc/bloc/counter/counter_a_bloc/bloc/counter_a_bloc.dart';

part 'counter_b_event.dart';
part 'counter_b_state.dart';

class CounterBBloc extends Bloc<CounterBEvent, CounterBState> {
  CounterBBloc() : super(CounterBState(count: 0)) {
    // Add Event
    on<CounterBEventAdd>((event, emit) {
      emit(state.copywith(count: state.count + 1));
    });
    // Reset Event
    on<CounterBEventReset>((event, emit) {
      emit(state.copywith(count: 0));
    });
  }
}
