import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// ลบ import ของ Counter A ออกเพราะไม่ได้ใช้งานในนี้
part 'counter_b_event.dart';
part 'counter_b_state.dart';

class CounterBBloc extends Bloc<CounterBEvent, CounterBState> {
  // กำหนดค่าเริ่มต้นให้ Counter B เป็น 0
  CounterBBloc() : super(const CounterBState(count: 0)) {
    // จัดการเหตุการณ์เพิ่มค่าของ B
    on<CounterBEventAdd>((event, emit) {
      // แก้ไขเป็น copyWith
      emit(state.copyWith(count: state.count + 1));
    });

    // จัดการเหตุการณ์ล้างค่าของ B
    on<CounterBEventReset>((event, emit) {
      // แก้ไขเป็น copyWith
      emit(state.copyWith(count: 0));
    });
  }
}
