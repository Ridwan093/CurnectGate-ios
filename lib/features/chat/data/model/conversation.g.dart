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
      id: fields[0] as int?,
      estateId: fields[1] as int?,
      type: fields[2] as String?,
      title: fields[3] as String?,
      participants: (fields[4] as List?)?.cast<Participant>(),
      latestMessage: fields[5] as LatestMessage?,
      lastMessageAt: fields[6] as String?,
      unreadCount: fields[7] as int?,
      settings: fields[8] as ConversationSettings?,
      createdAt: fields[9] as String?,
      updatedAt: fields[10] as String?,
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
      userId: fields[0] as int?,
      fullName: fields[1] as String?,
      avatarUrl: fields[2] as String?,
      role: fields[3] as String?,
      onlineStatus: fields[4] as String?,
      unreadCount: fields[5] as int?,
      lastReadAt: fields[6] as String?,
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
      id: fields[0] as int?,
      conversationId: fields[1] as int?,
      senderId: fields[2] as int?,
      sender: fields[3] as Sender?,
      messageText: fields[4] as String?,
      status: fields[5] as String?,
      read: fields[6] as bool?,
      isSender: fields[7] as bool?,
      createdAt: fields[8] as String?,
      updatedAt: fields[9] as String?,
      timeAgo: fields[10] as String?,
      attachments: (fields[11] as List?)?.cast<Attachment>(),
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
      id: fields[0] as int?,
      firstname: fields[1] as String?,
      lastname: fields[2] as String?,
      fullName: fields[3] as String?,
      avatarUrl: fields[4] as String?,
      role: fields[5] as String?,
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
      id: fields[0] as int?,
      conversationId: fields[1] as int?,
      notificationsEnabled: fields[2] as bool?,
      doNotDisturb: fields[3] as bool?,
      dndUntil: fields[4] as String?,
      dndActive: fields[5] as bool?,
      archived: fields[6] as bool?,
      pinned: fields[7] as bool?,
      createdAt: fields[8] as String?,
      updatedAt: fields[9] as String?,
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
