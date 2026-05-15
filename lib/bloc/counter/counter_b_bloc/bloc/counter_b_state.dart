part of 'counter_b_bloc.dart';

class CounterBState extends Equatable {
  final int count;

  // ใช้ const เพื่อความประหยัดหน่วยความจำ
  const CounterBState({required this.count});

  // แก้ไขจาก copywith เป็น copyWith
  CounterBState copyWith({int? count}) {
    return CounterBState(count: count ?? this.count);
  }

  @override
  String toString() {
    return "CounterBState(count: $count)";
  }

  @override
  // ต้องระบุ count ใน props เพื่อให้ Equatable ตรวจสอบความเปลี่ยนแปลงของข้อมูลได้
  List<Object> get props => [count];
}
