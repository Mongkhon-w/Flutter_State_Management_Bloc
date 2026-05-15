import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_a_event.dart';
part 'counter_a_state.dart';

class CounterABloc extends Bloc<CounterAEvent, CounterAState> {
  // กำหนดค่าเริ่มต้นให้ CounterA เป็น 0
  CounterABloc() : super(const CounterAState(count: 0)) {
    // เมื่อได้รับ Event การเพิ่มค่า (Add)
    on<CounterAEventAdd>((event, emit) {
      // ใช้ copyWith เพื่อสร้าง State ใหม่โดยอ้างอิงจากค่าเดิม
      emit(state.copyWith(count: state.count + 1));
    });

    // เมื่อได้รับ Event การล้างค่า (Reset)
    on<CounterAEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}
