import 'package:hive/hive.dart';

part 'M_enum.g.dart'; // Required for code generation

@HiveType(typeId: 0) // Unique typeID for Hive
enum MessageEnum {
  @HiveField(0) text('text'),
  @HiveField(1) image('image'),
  @HiveField(2) audio('audio'),
  @HiveField(3) video('video'),
  @HiveField(4) gif('gif');

  const MessageEnum(this.type);
  final String type;

  // Add this factory constructor for Hive
  factory MessageEnum.fromType(String type) {
    return type.toEnum();
  }
}

extension ConvertingMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'text':
        return MessageEnum.text;
      case 'audio':
        return MessageEnum.audio;
      case 'image':
        return MessageEnum.image;
      case 'gif':
        return MessageEnum.gif;
      case 'video':
        return MessageEnum.video;
      default:
        return MessageEnum.text;
    }
  }
}