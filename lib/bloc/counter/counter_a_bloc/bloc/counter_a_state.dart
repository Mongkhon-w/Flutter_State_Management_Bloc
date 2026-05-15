part of 'counter_a_bloc.dart';

sealed class CounterAState extends Equatable {
  const CounterAState();
  
  @override
  List<Object> get props => [];
}

final class CounterAInitial extends CounterAState {}
