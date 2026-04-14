// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final typeId = 0;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      title: fields[0] as String,
      description: fields[3] == null ? "" : fields[3] as String,
      group: fields[2] == null ? EventGroup.all : fields[2] as EventGroup,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.group)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventGroupAdapter extends TypeAdapter<EventGroup> {
  @override
  final typeId = 1;

  @override
  EventGroup read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EventGroup.all;
      case 1:
        return EventGroup.cse1;
      case 2:
        return EventGroup.cse2;
      case 3:
        return EventGroup.cse3;
      case 4:
        return EventGroup.ce1;
      case 5:
        return EventGroup.ce2;
      case 6:
        return EventGroup.ce3;
      case 10:
        return EventGroup.ft1;
      case 11:
        return EventGroup.ft2;
      case 12:
        return EventGroup.ft3;
      default:
        return EventGroup.all;
    }
  }

  @override
  void write(BinaryWriter writer, EventGroup obj) {
    switch (obj) {
      case EventGroup.all:
        writer.writeByte(0);
      case EventGroup.cse1:
        writer.writeByte(1);
      case EventGroup.cse2:
        writer.writeByte(2);
      case EventGroup.cse3:
        writer.writeByte(3);
      case EventGroup.ce1:
        writer.writeByte(4);
      case EventGroup.ce2:
        writer.writeByte(5);
      case EventGroup.ce3:
        writer.writeByte(6);
      case EventGroup.ft1:
        writer.writeByte(10);
      case EventGroup.ft2:
        writer.writeByte(11);
      case EventGroup.ft3:
        writer.writeByte(12);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
