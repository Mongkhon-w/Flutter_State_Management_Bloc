import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/bloc/counter/counter_a_bloc/bloc/counter_a_bloc.dart';
import 'package:flutter_state_management_bloc/bloc/counter/counter_b_bloc/bloc/counter_b_bloc.dart';
import 'package:flutter_state_management_bloc/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterABloc = BlocProvider<CounterABloc>(
      create: (context) => CounterABloc(),
    );

    final counterBBloc = BlocProvider<CounterBBloc>(
      create: (context) => CounterBBloc(),
    );
    return MultiBlocProvider(
      providers: [counterABloc, counterBBloc],
      child: MaterialApp(
        title: 'Home Page',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
