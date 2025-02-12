import 'package:hive/hive.dart';

part 'savings_model.g.dart';

@HiveType(typeId: 0)
class SavingsModel {
  @HiveField(0)
  final double compA;

  @HiveField(1)
  final double compB;

  @HiveField(2)
  final int year;

  @HiveField(3)
  final double withdrawn;

  SavingsModel({
    required this.compA,
    required this.compB,
    required this.year,
    required this.withdrawn,
  });
}