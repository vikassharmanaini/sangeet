// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModalsAdapter extends TypeAdapter<UserModals> {
  @override
  final int typeId = 0;

  @override
  UserModals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModals(
      id: fields[0] as String,
      display_name: fields[1] as String,
      email: fields[2] as String,
      userid: fields[3] as String,
      gender: fields[4] as String,
      phonenumber: fields[5] as String,
      img: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModals obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.display_name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.userid)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.phonenumber)
      ..writeByte(6)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
