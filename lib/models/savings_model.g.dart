// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingsModelAdapter extends TypeAdapter<SavingsModel> {
  @override
  final int typeId = 0;

  @override
  SavingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavingsModel(
      compA: fields[0] as double,
      compB: fields[1] as double,
      year: fields[2] as int,
      withdrawn: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SavingsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.compA)
      ..writeByte(1)
      ..write(obj.compB)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.withdrawn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
