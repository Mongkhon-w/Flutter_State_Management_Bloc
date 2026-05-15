import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ตรวจสอบ Path การ import ให้ตรงกับโครงสร้างโปรเจกต์ของคุณ
import '../bloc/counter/counter_a_bloc/bloc/counter_a_bloc.dart';
import '../bloc/counter/counter_b_bloc/bloc/counter_b_bloc.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key, required this.title});
  final String title;

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // แก้ไขจาก app_bar เป็น appBar (Camel Case)
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ส่วนแสดงผล Counter A
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter A',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CounterABloc, CounterAState>(
                  builder: (context, state) => Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            // ส่วนแสดงผล Counter B
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter B',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CounterBBloc, CounterBState>(
                  builder: (context, state) => Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButtons(context, "A"),
          _buildActionButtons(context, "B"),
        ],
      ),
    );
  }

  // Widget แยกย่อยสำหรับสร้างปุ่มควบคุม
  Widget _buildActionButtons(BuildContext context, String type) {
    bool isA = type == "A";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "btn${type}Reset", // ป้องกันแอปเด้งด้วยการแยก Tag
          onPressed: () => isA
              ? context.read<CounterABloc>().add(CounterAEventReset())
              : context.read<CounterBBloc>().add(CounterBEventReset()),
          tooltip: 'Reset $type',
          child: const Icon(Icons.restore),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: "btn${type}Add",
          onPressed: () => isA
              ? context.read<CounterABloc>().add(CounterAEventAdd())
              : context.read<CounterBBloc>().add(CounterBEventAdd()),
          tooltip: 'Add $type',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
