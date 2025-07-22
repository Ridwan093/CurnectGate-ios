class ActiveOtpModel {
  final String vistorName;
  final String visittype;

  final DateTime endDay;
   final DateTime endtime;
 



  ActiveOtpModel({

    required this.endtime,
    required this.endDay,
    required this.visittype,
    required this.vistorName,
    
    
  });
}

List<ActiveOtpModel> vistoCardList = [];




class OtpResponseModel {
  final bool status;
  final String message;
  final int code;
  final OtpData data;

  OtpResponseModel({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      status: json['status'],
      message: json['message'],
      code: json['code'],
      data: OtpData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'code': code,
        'data': data.toJson(),
      };
}

class OtpData {
  final List<Otp> otps;
  final Pagination pagination;
  final Summary summary;
  final Map<String, dynamic> filtersApplied;

  OtpData({
    required this.otps,
    required this.pagination,
    required this.summary,
    required this.filtersApplied,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) => OtpData(
        otps: (json['otps'] as List).map((e) => Otp.fromJson(e)).toList(),
        pagination: Pagination.fromJson(json['pagination']),
        summary: Summary.fromJson(json['summary']),
        filtersApplied: json['filters_applied'] ?? {},
      );

  Map<String, dynamic> toJson() => {
        'otps': otps.map((e) => e.toJson()).toList(),
        'pagination': pagination.toJson(),
        'summary': summary.toJson(),
        'filters_applied': filtersApplied,
      };
}

class Otp {
  final int id;
  final int estateId;
  final int propertyId;
  final int generatedBy;
  final String otpCode;
  final String barcodeData;
  final String qrCodeData;
  final String visitorName;
  final String purpose;
  final DateTime validFrom;
  final DateTime validUntil;
  final int validityHours;
  final String status;
  final bool requiresSecurityValidation;
  final String securityClearanceLevel;
  final dynamic usedAt;
  final dynamic usedBy;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double timeRemaining;
  final bool isActive;
  final String countdownDisplay;
  final String securityStatus;
  final DestinationInfo destinationInfo;
  final Estate estate;
  final Property property;

  Otp({
    required this.id,
    required this.estateId,
    required this.propertyId,
    required this.generatedBy,
    required this.otpCode,
    required this.barcodeData,
    required this.qrCodeData,
    required this.visitorName,
    required this.purpose,
    required this.validFrom,
    required this.validUntil,
    required this.validityHours,
    required this.status,
    required this.requiresSecurityValidation,
    required this.securityClearanceLevel,
    this.usedAt,
    this.usedBy,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.timeRemaining,
    required this.isActive,
    required this.countdownDisplay,
    required this.securityStatus,
    required this.destinationInfo,
    required this.estate,
    required this.property,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        id: json['id'],
        estateId: json['estate_id'],
        propertyId: json['property_id'],
        generatedBy: json['generated_by'],
        otpCode: json['otp_code'],
        barcodeData: json['barcode_data'],
        qrCodeData: json['qr_code_data'],
        visitorName: json['visitor_name'],
        purpose: json['purpose'],
        validFrom: DateTime.parse(json['valid_from']),
        validUntil: DateTime.parse(json['valid_until']),
        validityHours: json['validity_hours'],
        status: json['status'],
        requiresSecurityValidation: json['requires_security_validation'] == 1,
        securityClearanceLevel: json['security_clearance_level'],
        usedAt: json['used_at'],
        usedBy: json['used_by'],
        metadata: json['metadata'] ?? {},
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        timeRemaining: json['time_remaining']?.toDouble() ?? 0.0,
        isActive: json['is_active'],
        countdownDisplay: json['countdown_display'],
        securityStatus: json['security_status'],
        destinationInfo: DestinationInfo.fromJson(json['destination_info']),
        estate: Estate.fromJson(json['estate']),
        property: Property.fromJson(json['property']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'estate_id': estateId,
        'property_id': propertyId,
        'generated_by': generatedBy,
        'otp_code': otpCode,
        'barcode_data': barcodeData,
        'qr_code_data': qrCodeData,
        'visitor_name': visitorName,
        'purpose': purpose,
        'valid_from': validFrom.toIso8601String(),
        'valid_until': validUntil.toIso8601String(),
        'validity_hours': validityHours,
        'status': status,
        'requires_security_validation': requiresSecurityValidation ? 1 : 0,
        'security_clearance_level': securityClearanceLevel,
        'used_at': usedAt,
        'used_by': usedBy,
        'metadata': metadata,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'time_remaining': timeRemaining,
        'is_active': isActive,
        'countdown_display': countdownDisplay,
        'security_status': securityStatus,
        'destination_info': destinationInfo.toJson(),
        'estate': estate.toJson(),
        'property': property.toJson(),
      };
}

class Pagination {
  final int currentPage;
  final int perPage;
  final int total;
  final int totalPages;
  final bool hasMore;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['current_page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        hasMore: json['has_more'],
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'has_more': hasMore,
      };
}

class Summary {
  final int totalGenerated;
  final int scheduled;
  final int active;
  final int used;
  final int expired;
  final int revoked;
  final int pendingValidation;
  final int thisMonth;
  final int thisWeek;

  Summary({
    required this.totalGenerated,
    required this.scheduled,
    required this.active,
    required this.used,
    required this.expired,
    required this.revoked,
    required this.pendingValidation,
    required this.thisMonth,
    required this.thisWeek,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        totalGenerated: json['total_generated'],
        scheduled: json['scheduled'],
        active: json['active'],
        used: json['used'],
        expired: json['expired'],
        revoked: json['revoked'],
        pendingValidation: json['pending_validation'],
        thisMonth: json['this_month'],
        thisWeek: json['this_week'],
      );

  Map<String, dynamic> toJson() => {
        'total_generated': totalGenerated,
        'scheduled': scheduled,
        'active': active,
        'used': used,
        'expired': expired,
        'revoked': revoked,
        'pending_validation': pendingValidation,
        'this_month': thisMonth,
        'this_week': thisWeek,
      };
}

class DestinationInfo {
  final String propertyName;
  final String propertyCode;
  final String fullAddress;
  final String directions;
  final String blockNumber;
  final String buildingName;
  final String streetName;
  final String landmark;

  DestinationInfo({
    required this.propertyName,
    required this.propertyCode,
    required this.fullAddress,
    required this.directions,
    required this.blockNumber,
    required this.buildingName,
    required this.streetName,
    required this.landmark,
  });

  factory DestinationInfo.fromJson(Map<String, dynamic> json) => DestinationInfo(
        propertyName: json['property_name'],
        propertyCode: json['property_code'],
        fullAddress: json['full_address'],
        directions: json['directions'],
        blockNumber: json['block_number'],
        buildingName: json['building_name'],
        streetName: json['street_name'],
        landmark: json['landmark'],
      );

  Map<String, dynamic> toJson() => {
        'property_name': propertyName,
        'property_code': propertyCode,
        'full_address': fullAddress,
        'directions': directions,
        'block_number': blockNumber,
        'building_name': buildingName,
        'street_name': streetName,
        'landmark': landmark,
      };
}

class Estate {
  final int id;
  final String name;
  final int onboardedBy;
  final String address;
  final String estateCode;
  final int stateId;
  final String city;
  final String postalCode;
  final String contactEmail;
  final String contactPhone;
  final Map<String, dynamic> settings;
  final String status;
  final String? mediaUrl;
  final String? mediaKey;
  final DateTime createdAt;
  final DateTime updatedAt;

  Estate({
    required this.id,
    required this.name,
    required this.onboardedBy,
    required this.address,
    required this.estateCode,
    required this.stateId,
    required this.city,
    required this.postalCode,
    required this.contactEmail,
    required this.contactPhone,
    required this.settings,
    required this.status,
    required this.mediaUrl,
    required this.mediaKey,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Estate.fromJson(Map<String, dynamic> json) => Estate(
        id: json['id'],
        name: json['name'],
        onboardedBy: json['onboarded_by'],
        address: json['address'],
        estateCode: json['estate_code'],
        stateId: json['state_id'],
        city: json['city'],
        postalCode: json['postal_code'],
        contactEmail: json['contact_email'],
        contactPhone: json['contact_phone'],
        settings: json['settings'] ?? {},
        status: json['status'],
        mediaUrl: json['media_url'],
        mediaKey: json['media_key'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'onboarded_by': onboardedBy,
        'address': address,
        'estate_code': estateCode,
        'state_id': stateId,
        'city': city,
        'postal_code': postalCode,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'settings': settings,
        'status': status,
        'media_url': mediaUrl,
        'media_key': mediaKey,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
// property_model.dart

class Property {
  final int id;
  final int estateId;
  final int landlordId;
  final dynamic managerId;
  final int estateAddressId;
  final String propertyCode;
  final String propertyName;
  final String propertyType;
  final String? imageUrl;
  final String? imageKey;
  final int bedrooms;
  final int bathrooms;
  final String size;
  final String description;
  final dynamic specialFeatures;
  final String rentalAmount;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic condition;
  final String rentalFrequency;
  final List<String> amenities;
  final dynamic utilityConnections;
  final dynamic images;
  final dynamic parkingSpaces;
  final String status;
  final int smokingAllowed;
  final bool isFurnished;
  final int maxOccupants;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EstateAddress estateAddress;

  Property({
    required this.id,
    required this.estateId,
    required this.landlordId,
    required this.managerId,
    required this.estateAddressId,
    required this.propertyCode,
    required this.propertyName,
    required this.propertyType,
    required this.imageUrl,
    required this.imageKey,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.description,
    required this.specialFeatures,
    required this.rentalAmount,
    required this.latitude,
    required this.longitude,
    required this.condition,
    required this.rentalFrequency,
    required this.amenities,
    required this.utilityConnections,
    required this.images,
    required this.parkingSpaces,
    required this.status,
    required this.smokingAllowed,
    required this.isFurnished,
    required this.maxOccupants,
    required this.createdAt,
    required this.updatedAt,
    required this.estateAddress,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json['id'] ?? 0,
        estateId: json['estate_id'] ?? 0,
        landlordId: json['landlord_id'] ?? 0,
        managerId: json['manager_id'],
        estateAddressId: json['estate_address_id'] ?? 0,
        propertyCode: json['property_code'] ?? '',
        propertyName: json['property_name'] ?? '',
        propertyType: json['property_type'] ?? '',
        imageUrl: json['image_url'],
        imageKey: json['image_key'],
        bedrooms: json['bedrooms'] ?? 0,
        bathrooms: json['bathrooms'] ?? 0,
        size: json['size'] ?? '',
        description: json['description'] ?? '',
        specialFeatures: json['special_features'],
        rentalAmount: json['rental_amount'] ?? '',
        latitude: json['latitude'],
        longitude: json['longitude'],
        condition: json['condition'],
        rentalFrequency: json['rental_frequency'] ?? '',
        amenities: List<String>.from(json['amenities'] ?? []),
        utilityConnections: json['utility_connections'],
        images: json['images'],
        parkingSpaces: json['parking_spaces'],
        status: json['status'] ?? '',
        smokingAllowed: json['smoking_allowed'] ?? 0,
        isFurnished: json['is_furnished'] ?? false,
        maxOccupants: json['max_occupants'] ?? 0,
        createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
        estateAddress: EstateAddress.fromJson(json['estate_address'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'estate_id': estateId,
        'landlord_id': landlordId,
        'manager_id': managerId,
        'estate_address_id': estateAddressId,
        'property_code': propertyCode,
        'property_name': propertyName,
        'property_type': propertyType,
        'image_url': imageUrl,
        'image_key': imageKey,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'size': size,
        'description': description,
        'special_features': specialFeatures,
        'rental_amount': rentalAmount,
        'latitude': latitude,
        'longitude': longitude,
        'condition': condition,
        'rental_frequency': rentalFrequency,
        'amenities': amenities,
        'utility_connections': utilityConnections,
        'images': images,
        'parking_spaces': parkingSpaces,
        'status': status,
        'smoking_allowed': smokingAllowed,
        'is_furnished': isFurnished,
        'max_occupants': maxOccupants,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'estate_address': estateAddress.toJson(),
      };
}
class EstateAddress {
  final int id;
  final String addressType;
  final String streetNumber;
  final String streetName;
  final String blockNumber;
  final String flatNumber;
  final String buildingName;
  final String estateName;
  final String city;
  final String state;
  final String? postalCode;
  final dynamic skipDuplicateCheck;
  final dynamic duplicateAction;
  final String country;
  final String latitude;
  final String longitude;
  final String landmarkDescription;
  final int estateId;
  final int createdBy;
  final bool isActive;
  final List<dynamic> additionalInfo;
  final DateTime createdAt;
  final DateTime updatedAt;

  EstateAddress({
    required this.id,
    required this.addressType,
    required this.streetNumber,
    required this.streetName,
    required this.blockNumber,
    required this.flatNumber,
    required this.buildingName,
    required this.estateName,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.skipDuplicateCheck,
    required this.duplicateAction,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.landmarkDescription,
    required this.estateId,
    required this.createdBy,
    required this.isActive,
    required this.additionalInfo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EstateAddress.fromJson(Map<String, dynamic> json) => EstateAddress(
        id: json['id'] ?? 0,
        addressType: json['address_type'] ?? '',
        streetNumber: json['street_number'] ?? '',
        streetName: json['street_name'] ?? '',
        blockNumber: json['block_number'] ?? '',
        flatNumber: json['flat_number'] ?? '',
        buildingName: json['building_name'] ?? '',
        estateName: json['estate_name'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        postalCode: json['postal_code'],
        skipDuplicateCheck: json['skip_duplicate_check'],
        duplicateAction: json['duplicate_action'],
        country: json['country'] ?? '',
        latitude: json['latitude'] ?? '',
        longitude: json['longitude'] ?? '',
        landmarkDescription: json['landmark_description'] ?? '',
        estateId: json['estate_id'] ?? 0,
        createdBy: json['created_by'] ?? 0,
        isActive: json['is_active'] ?? true,
        additionalInfo: json['additional_info'] ?? [],
        createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address_type': addressType,
        'street_number': streetNumber,
        'street_name': streetName,
        'block_number': blockNumber,
        'flat_number': flatNumber,
        'building_name': buildingName,
        'estate_name': estateName,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'skip_duplicate_check': skipDuplicateCheck,
        'duplicate_action': duplicateAction,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
        'landmark_description': landmarkDescription,
        'estate_id': estateId,
        'created_by': createdBy,
        'is_active': isActive,
        'additional_info': additionalInfo,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
