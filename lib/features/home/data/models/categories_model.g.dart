// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesModelAdapter extends TypeAdapter<CategoriesModel> {
  @override
  final int typeId = 0;

  @override
  CategoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesModel(
      workoutName: fields[0] as String,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.workoutName)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
