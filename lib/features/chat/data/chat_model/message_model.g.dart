// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessagesAdapter extends TypeAdapter<Messages> {
  @override
  final int typeId = 1;

  @override
  Messages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Messages(
      senderID: fields[0] as String,
      reciverID: fields[1] as String,
      text: fields[2] as String,
      type: fields[3] as MessageEnum,
      messageId: fields[4] as String,
      isSeen: fields[5] as bool,
      timeSend: fields[6] as DateTime,
      senderusername: fields[10] as String,
      reciverusername: fields[11] as String,
      repliedMessage: fields[7] as String,
      repliedTo: fields[8] as String,
      repliedMessageType: fields[9] as MessageEnum,
      isFailed: fields[12] as bool,
      isReceiverCopy: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Messages obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.senderID)
      ..writeByte(1)
      ..write(obj.reciverID)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.messageId)
      ..writeByte(5)
      ..write(obj.isSeen)
      ..writeByte(6)
      ..write(obj.timeSend)
      ..writeByte(7)
      ..write(obj.repliedMessage)
      ..writeByte(8)
      ..write(obj.repliedTo)
      ..writeByte(9)
      ..write(obj.repliedMessageType)
      ..writeByte(10)
      ..write(obj.senderusername)
      ..writeByte(11)
      ..write(obj.reciverusername)
      ..writeByte(12)
      ..write(obj.isFailed)
      ..writeByte(13)
      ..write(obj.isReceiverCopy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
