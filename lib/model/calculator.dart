import 'dart:math';
import 'package:uuid/uuid.dart';

class CalculateBmi {
  final int weight;
  final int height;
  final String uuid;

  CalculateBmi(this.weight, this.height) : uuid = const Uuid().v4();

  @override
  bool operator ==(covariant CalculateBmi other) => uuid != other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
