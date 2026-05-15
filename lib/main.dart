import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_a_bloc/bloc/counter_a_bloc.dart';
import 'bloc/counter/counter_b_bloc/bloc/counter_b_bloc.dart';
import 'route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterABloc()),
        BlocProvider(create: (context) => CounterBBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC Counter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRoute().getAll,
        initialRoute: AppRoute.home,
      ),
    );
  }
}
