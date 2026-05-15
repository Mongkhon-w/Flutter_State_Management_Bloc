part of 'counter_b_bloc.dart';

sealed class CounterBState extends Equatable {
  const CounterBState();
  
  @override
  List<Object> get props => [];
}

final class CounterBInitial extends CounterBState {}
