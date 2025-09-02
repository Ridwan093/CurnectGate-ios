

enum ActivityStatus { granted, denied, completed, pending }

class ActivityItem {
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final String actualDate;
  final ActivityStatus status;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.actualDate,
    required this.date,
  });
}

// class NotificationResponse {
//   late final bool? status;
//   final String? message;
//   final int? code;
//   final NotificationData? data;

//   NotificationResponse({
//     this.status,
//     this.message,
//     this.code,
//     this.data,
//   });

//   factory NotificationResponse.fromJson(Map<String, dynamic> json) {
//     return NotificationResponse(
//       status: json['status'],
//       message: json['message'],
//       code: json['code'],
//       data: json['data'] != null ? NotificationData.fromJson(json['data']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'message': message,
//         'code': code,
//         'data': data?.toJson(),
//       };
// }

// class NotificationData {
//   final List<NotificationItem>? notifications;
//   final int? count;

//   NotificationData({
//     this.notifications,
//     this.count,
//   });

//   factory NotificationData.fromJson(Map<String, dynamic> json) {
//     return NotificationData(
//       notifications: json['notifications'] != null
//           ? List<NotificationItem>.from(
//               json['notifications'].map((x) => NotificationItem.fromJson(x)))
//           : [],
//       count: json['count'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'notifications': notifications?.map((x) => x.toJson()).toList(),
//         'count': count,
//       };
// }

// class NotificationItem {
//   final int? id;
//   final int? userId;
//   final int? estateId;
//   final String? mediaUrl;
//   final String? mediaKey;
//   final String? type;
//   final String? description;
//   final String? status;
//   final String? createdAt;
//   final String? updatedAt;
//   final Estate? estate;

//   NotificationItem({
//     this.id,
//     this.userId,
//     this.estateId,
//     this.mediaUrl,
//     this.mediaKey,
//     this.type,
//     this.description,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.estate,
//   });

//   factory NotificationItem.fromJson(Map<String, dynamic> json) {
//     return NotificationItem(
//       id: json['id'],
//       userId: json['user_id'],
//       estateId: json['estate_id'],
//       mediaUrl: json['media_url'],
//       mediaKey: json['media_key'],
//       type: json['type'],
//       description: json['description'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       estate: json['estate'] != null ? Estate.fromJson(json['estate']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_id': userId,
//         'estate_id': estateId,
//         'media_url': mediaUrl,
//         'media_key': mediaKey,
//         'type': type,
//         'description': description,
//         'status': status,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'estate': estate?.toJson(),
//       };
// }

// class Estate {
//   final int? id;
//   final String? name;
//   final int? onboardedBy;
//   final String? address;
//   final String? estateCode;
//   final int? stateId;
//   final String? city;
//   final String? postalCode;
//   final String? contactEmail;
//   final String? contactPhone;
//   final EstateSettings? settings;
//   final String? status;
//   final String? mediaUrl;
//   final String? mediaKey;
//   final String? createdAt;
//   final String? updatedAt;

//   Estate({
//     this.id,
//     this.name,
//     this.onboardedBy,
//     this.address,
//     this.estateCode,
//     this.stateId,
//     this.city,
//     this.postalCode,
//     this.contactEmail,
//     this.contactPhone,
//     this.settings,
//     this.status,
//     this.mediaUrl,
//     this.mediaKey,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Estate.fromJson(Map<String, dynamic> json) {
//     return Estate(
//       id: json['id'],
//       name: json['name'],
//       onboardedBy: json['onboarded_by'],
//       address: json['address'],
//       estateCode: json['estate_code'],
//       stateId: json['state_id'],
//       city: json['city'],
//       postalCode: json['postal_code'],
//       contactEmail: json['contact_email'],
//       contactPhone: json['contact_phone'],
//       settings: json['settings'] != null ? EstateSettings.fromJson(json['settings']) : null,
//       status: json['status'],
//       mediaUrl: json['media_url'],
//       mediaKey: json['media_key'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'onboarded_by': onboardedBy,
//         'address': address,
//         'estate_code': estateCode,
//         'state_id': stateId,
//         'city': city,
//         'postal_code': postalCode,
//         'contact_email': contactEmail,
//         'contact_phone': contactPhone,
//         'settings': settings?.toJson(),
//         'status': status,
//         'media_url': mediaUrl,
//         'media_key': mediaKey,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//       };
// }

// class EstateSettings {
//   final bool? autoApproveUsers;
//   final bool? requireDeedSignature;
//   final bool? visitorApprovalRequired;
//   final List<dynamic>? emergencyContacts;
//   final String? imageUrl;
//   final String? imageKey;
//   final OperatingHours? operatingHours;
//   final String? image_Key;

//   EstateSettings({
//     this.autoApproveUsers,
//     this.requireDeedSignature,
//     this.visitorApprovalRequired,
//     this.emergencyContacts,
//     this.imageUrl,
//     this.imageKey,
//     this.operatingHours,
//     this.image_Key,
//   });

//   factory EstateSettings.fromJson(Map<String, dynamic> json) {
//     return EstateSettings(
//       autoApproveUsers: json['auto_approve_users'],
//       requireDeedSignature: json['require_deed_signature'],
//       visitorApprovalRequired: json['visitor_approval_required'],
//       emergencyContacts: json['emergency_contacts'],
//       imageUrl: json['image_url'],
//       imageKey: json['image_key'],
//       operatingHours: json['operating_hours'] != null
//           ? OperatingHours.fromJson(json['operating_hours'])
//           : null,
//       image_Key: json['image_Key'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'auto_approve_users': autoApproveUsers,
//         'require_deed_signature': requireDeedSignature,
//         'visitor_approval_required': visitorApprovalRequired,
//         'emergency_contacts': emergencyContacts,
//         'image_url': imageUrl,
//         'image_key': imageKey,
//         'operating_hours': operatingHours?.toJson(),
//         'image_Key': image_Key,
//       };
// }

// class OperatingHours {
//   final String? gateOpen;
//   final String? gateClose;

//   OperatingHours({
//     this.gateOpen,
//     this.gateClose,
//   });

//   factory OperatingHours.fromJson(Map<String, dynamic> json) {
//     return OperatingHours(
//       gateOpen: json['gate_open'],
//       gateClose: json['gate_close'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'gate_open': gateOpen,
//         'gate_close': gateClose,
//       };
// }
