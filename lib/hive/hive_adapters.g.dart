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

class DayAdapter extends TypeAdapter<Day> {
  @override
  final typeId = 2;

  @override
  Day read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Day.monday;
      case 1:
        return Day.tuesday;
      case 2:
        return Day.wednesday;
      case 3:
        return Day.thursday;
      case 4:
        return Day.friday;
      default:
        return Day.monday;
    }
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    switch (obj) {
      case Day.monday:
        writer.writeByte(0);
      case Day.tuesday:
        writer.writeByte(1);
      case Day.wednesday:
        writer.writeByte(2);
      case Day.thursday:
        writer.writeByte(3);
      case Day.friday:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimelineItemAdapter extends TypeAdapter<TimelineItem> {
  @override
  final typeId = 3;

  @override
  TimelineItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineItem(
      startTime: (fields[0] as num).toInt(),
      endTime: (fields[1] as num).toInt(),
      subjectName: fields[2] as String,
      subjectCode: fields[6] as String?,
      instructorName: fields[4] as String?,
      iconUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.endTime)
      ..writeByte(2)
      ..write(obj.subjectName)
      ..writeByte(4)
      ..write(obj.instructorName)
      ..writeByte(5)
      ..write(obj.iconUrl)
      ..writeByte(6)
      ..write(obj.subjectCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoutineScheduleAdapter extends TypeAdapter<RoutineSchedule> {
  @override
  final typeId = 4;

  @override
  RoutineSchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoutineSchedule(
      (fields[0] as Map).map(
        (dynamic k, dynamic v) =>
            MapEntry(k as Day, (v as List).cast<TimelineItem>()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, RoutineSchedule obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.scheduleMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutineScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserPreferencesAdapter extends TypeAdapter<UserPreferences> {
  @override
  final typeId = 5;

  @override
  UserPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPreferences(
      isDarkMode: fields[0] == null ? false : fields[0] as bool,
      selectedBranch: fields[1] == null ? Branch.cse : fields[1] as Branch,
      selectedSemester: fields[2] == null ? 1 : (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, UserPreferences obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.selectedBranch)
      ..writeByte(2)
      ..write(obj.selectedSemester);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BranchAdapter extends TypeAdapter<Branch> {
  @override
  final typeId = 6;

  @override
  Branch read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Branch.cse;
      case 1:
        return Branch.ce;
      case 2:
        return Branch.ft;
      default:
        return Branch.cse;
    }
  }

  @override
  void write(BinaryWriter writer, Branch obj) {
    switch (obj) {
      case Branch.cse:
        writer.writeByte(0);
      case Branch.ce:
        writer.writeByte(1);
      case Branch.ft:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
