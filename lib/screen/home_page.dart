import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/bloc/counter/counter_a_bloc/bloc/counter_a_bloc.dart';
import 'package:flutter_state_management_bloc/route/app_route.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            // ใช้ Navigator เพื่อไปยังหน้า CountPage ตามที่ตั้งไว้ใน AppRoute
            onPressed: () => Navigator.pushNamed(context, AppRoute.count),
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: Column(
          // แก้ไขจุดนี้: ต้องใช้ MainAxisAlignment.center (ห้ามลืมชื่อ Class)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterABloc, CounterAState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // ป้องกันปัญหา Hero Tag ซ้ำถ้าหน้านี้ถูกเรียกซ้ำซ้อน
            heroTag: "homeReset",
            onPressed: () =>
                context.read<CounterABloc>().add(CounterAEventReset()),
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "homeAdd",
            onPressed: () =>
                context.read<CounterABloc>().add(CounterAEventAdd()),
            tooltip: 'Add',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
