class GetUserNotificationSettings {
    GetUserNotificationSettings({
        required this.status,
        required this.message,
        required this.code,
        required this.data,
    });

    final bool? status;
    final String? message;
    final int? code;
    final Data? data;

    GetUserNotificationSettings copyWith({
        bool? status,
        String? message,
        int? code,
        Data? data,
    }) {
        return GetUserNotificationSettings(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );
    }

    factory GetUserNotificationSettings.fromJson(Map<String, dynamic> json){ 
        return GetUserNotificationSettings(
            status: json["status"],
            message: json["message"],
            code: json["code"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
    };

}

class Data {
    Data({
        required this.notifications,
    });

    final Notifications? notifications;

    Data copyWith({
        Notifications? notifications,
    }) {
        return Data(
            notifications: notifications ?? this.notifications,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            notifications: json["notifications"] == null ? null : Notifications.fromJson(json["notifications"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "notifications": notifications?.toJson(),
    };

}

class Notifications {
    Notifications({
        required this.email,
        required this.sms,
        required this.push,
        required this.payments,
        required this.security,
        required this.community,
        required this.maintenance,
        required this.paymentReminders,
        required this.communityUpdates,
        required this.maintenanceAlerts,
    });

    final Community? email;
    final Community? sms;
    final Community? push;
    final Community? payments;
    final Community? security;
    final Community? community;
    final Community? maintenance;
    final Community? paymentReminders;
    final Community? communityUpdates;
    final Community? maintenanceAlerts;

    Notifications copyWith({
        Community? email,
        Community? sms,
        Community? push,
        Community? payments,
        Community? security,
        Community? community,
        Community? maintenance,
        Community? paymentReminders,
        Community? communityUpdates,
        Community? maintenanceAlerts,
    }) {
        return Notifications(
            email: email ?? this.email,
            sms: sms ?? this.sms,
            push: push ?? this.push,
            payments: payments ?? this.payments,
            security: security ?? this.security,
            community: community ?? this.community,
            maintenance: maintenance ?? this.maintenance,
            paymentReminders: paymentReminders ?? this.paymentReminders,
            communityUpdates: communityUpdates ?? this.communityUpdates,
            maintenanceAlerts: maintenanceAlerts ?? this.maintenanceAlerts,
        );
    }

    factory Notifications.fromJson(Map<String, dynamic> json){ 
        return Notifications(
            email: json["email"] == null ? null : Community.fromJson(json["email"]),
            sms: json["sms"] == null ? null : Community.fromJson(json["sms"]),
            push: json["push"] == null ? null : Community.fromJson(json["push"]),
            payments: json["payments"] == null ? null : Community.fromJson(json["payments"]),
            security: json["security"] == null ? null : Community.fromJson(json["security"]),
            community: json["community"] == null ? null : Community.fromJson(json["community"]),
            maintenance: json["maintenance"] == null ? null : Community.fromJson(json["maintenance"]),
            paymentReminders: json["payment_reminders"] == null ? null : Community.fromJson(json["payment_reminders"]),
            communityUpdates: json["community_updates"] == null ? null : Community.fromJson(json["community_updates"]),
            maintenanceAlerts: json["maintenance_alerts"] == null ? null : Community.fromJson(json["maintenance_alerts"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
        "sms": sms?.toJson(),
        "push": push?.toJson(),
        "payments": payments?.toJson(),
        "security": security?.toJson(),
        "community": community?.toJson(),
        "maintenance": maintenance?.toJson(),
        "payment_reminders": paymentReminders?.toJson(),
        "community_updates": communityUpdates?.toJson(),
        "maintenance_alerts": maintenanceAlerts?.toJson(),
    };

}

class Community {
    Community({
        required this.name,
        required this.description,
        required this.type,
        required this.key,
        required this.value,
    });

    final String? name;
    final String? description;
    final String? type;
    final String? key;
    final bool? value;

    Community copyWith({
        String? name,
        String? description,
        String? type,
        String? key,
        bool? value,
    }) {
        return Community(
            name: name ?? this.name,
            description: description ?? this.description,
            type: type ?? this.type,
            key: key ?? this.key,
            value: value ?? this.value,
        );
    }

    factory Community.fromJson(Map<String, dynamic> json){ 
        return Community(
            name: json["name"],
            description: json["description"],
            type: json["type"],
            key: json["key"],
            value: json["value"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type": type,
        "key": key,
        "value": value,
    };

}
