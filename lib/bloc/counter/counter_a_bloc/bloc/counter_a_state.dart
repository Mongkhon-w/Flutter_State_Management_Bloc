part of 'counter_a_bloc.dart';

class CounterAState extends Equatable {
  final int count;

  // ใช้ const constructor เพื่อประสิทธิภาพในการจองหน่วยความจำ
  const CounterAState({required this.count});

  // ฟังก์ชันสำคัญสำหรับเปลี่ยนสถานะโดยสร้าง Object ใหม่
  CounterAState copyWith({int? count}) {
    return CounterAState(count: count ?? this.count);
  }

  @override
  String toString() => 'CounterAState(count: $count)';

  @override
  // ต้องระบุ count ใน props เพื่อให้ Equatable รู้ว่าถ้าเลขเดิมไม่ต้อง Re-build UI
  List<Object> get props => [count];
}
