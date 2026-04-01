// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationAdapter extends TypeAdapter<Conversation> {
  @override
  final int typeId = 2;

  @override
  Conversation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Conversation(
      id: NullSafetyHelper.safeInt(fields[0]),
      estateId: NullSafetyHelper.safeInt(fields[1]),
      type: NullSafetyHelper.safeString(fields[2]),
      title: NullSafetyHelper.safeString(fields[3]),

      participants:
          fields[4] is List
              ? (fields[4] as List)
                  .map((e) => e is Participant ? e : null)
                  .whereType<Participant>()
                  .toList()
              : null,

      latestMessage: fields[5] is LatestMessage ? fields[5] : null,

      lastMessageAt: NullSafetyHelper.safeString(fields[6]),

      unreadCount: NullSafetyHelper.safeInt(fields[7]),

      settings: fields[8] is ConversationSettings ? fields[8] : null,

      createdAt: NullSafetyHelper.safeString(fields[9]),
      updatedAt: NullSafetyHelper.safeString(fields[10]),
    );
  }

  @override
  void write(BinaryWriter writer, Conversation obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.estateId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.participants)
      ..writeByte(5)
      ..write(obj.latestMessage)
      ..writeByte(6)
      ..write(obj.lastMessageAt)
      ..writeByte(7)
      ..write(obj.unreadCount)
      ..writeByte(8)
      ..write(obj.settings)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParticipantAdapter extends TypeAdapter<Participant> {
  @override
  final int typeId = 3;

  @override
  Participant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Participant(
      userId: NullSafetyHelper.safeInt(fields[0]),
      fullName: NullSafetyHelper.safeString(fields[1]),
      avatarUrl: NullSafetyHelper.safeString(fields[2]),
      role: NullSafetyHelper.safeString(fields[3]),
      onlineStatus: NullSafetyHelper.safeString(fields[4]),
      unreadCount: NullSafetyHelper.safeInt(fields[5]),
      lastReadAt: NullSafetyHelper.safeString(fields[6]),
    );
  }

  @override
  void write(BinaryWriter writer, Participant obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.onlineStatus)
      ..writeByte(5)
      ..write(obj.unreadCount)
      ..writeByte(6)
      ..write(obj.lastReadAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParticipantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LatestMessageAdapter extends TypeAdapter<LatestMessage> {
  @override
  final int typeId = 4;

  @override
  LatestMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatestMessage(
      id: NullSafetyHelper.safeInt(fields[0]),
      conversationId: NullSafetyHelper.safeInt(fields[1]),
      senderId: NullSafetyHelper.safeInt(fields[2]),

      sender: fields[3] is Sender ? fields[3] : null,

      messageText: NullSafetyHelper.safeString(fields[4]),
      status: NullSafetyHelper.safeString(fields[5]),
      read: NullSafetyHelper.safeBool(fields[6]),
      isSender: NullSafetyHelper.safeBool(fields[7]),

      createdAt: NullSafetyHelper.safeString(fields[8]),
      updatedAt: NullSafetyHelper.safeString(fields[9]),
      timeAgo: NullSafetyHelper.safeString(fields[10]),
      attachments:
          fields[11] is List
              ? (fields[11] as List)
                  .map((e) => e is Attachment ? e : null)
                  .whereType<Attachment>()
                  .toList()
              : null,
    );
  }

  @override
  void write(BinaryWriter writer, LatestMessage obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.conversationId)
      ..writeByte(2)
      ..write(obj.senderId)
      ..writeByte(3)
      ..write(obj.sender)
      ..writeByte(4)
      ..write(obj.messageText)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.read)
      ..writeByte(7)
      ..write(obj.isSender)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.timeAgo)
      ..writeByte(11)
      ..write(obj.attachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SenderAdapter extends TypeAdapter<Sender> {
  @override
  final int typeId = 5;

  @override
  Sender read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sender(
      id: NullSafetyHelper.safeInt(fields[0]),
      firstname: NullSafetyHelper.safeString(fields[1]),
      lastname: NullSafetyHelper.safeString(fields[2]),
      fullName: NullSafetyHelper.safeString(fields[3]),
      avatarUrl: NullSafetyHelper.safeString(fields[4]),
      role: NullSafetyHelper.safeString(fields[5]),
    );
  }

  @override
  void write(BinaryWriter writer, Sender obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.lastname)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.avatarUrl)
      ..writeByte(5)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConversationSettingsAdapter extends TypeAdapter<ConversationSettings> {
  @override
  final int typeId = 6;

  @override
  ConversationSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationSettings(
      id: NullSafetyHelper.safeInt(fields[0]),
      conversationId: NullSafetyHelper.safeInt(fields[1]),
      notificationsEnabled: NullSafetyHelper.safeBool(fields[2]),
      doNotDisturb: NullSafetyHelper.safeBool(fields[3]),
      dndUntil: NullSafetyHelper.safeString(fields[4]),
      dndActive: NullSafetyHelper.safeBool(fields[5]),
      archived: NullSafetyHelper.safeBool(fields[6]),
      pinned: NullSafetyHelper.safeBool(fields[7]),
      createdAt: NullSafetyHelper.safeString(fields[8]),
      updatedAt: NullSafetyHelper.safeString(fields[9]),
    );
  }

  @override
  void write(BinaryWriter writer, ConversationSettings obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.conversationId)
      ..writeByte(2)
      ..write(obj.notificationsEnabled)
      ..writeByte(3)
      ..write(obj.doNotDisturb)
      ..writeByte(4)
      ..write(obj.dndUntil)
      ..writeByte(5)
      ..write(obj.dndActive)
      ..writeByte(6)
      ..write(obj.archived)
      ..writeByte(7)
      ..write(obj.pinned)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
