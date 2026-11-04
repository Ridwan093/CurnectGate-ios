

// class EstateAddressResponse {
//   final bool status;
//   final String message;
//   final int code;
//   final AddressData data;

//   EstateAddressResponse({
//     required this.status,
//     required this.message,
//     required this.code,
//     required this.data,
//   });

//   factory EstateAddressResponse.fromJson(Map<String, dynamic> json) {
//     return EstateAddressResponse(
//       status: json['status'],
//       message: json['message'],
//       code: json['code'],
//       data: AddressData.fromJson(json['data']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'message': message,
//         'code': code,
//         'data': data.toJson(),
//       };
// }

// class AddressData {
//   final List<EstateAddress> addresses;
//   final int total;

//   AddressData({
//     required this.addresses,
//     required this.total,
//   });

//   factory AddressData.fromJson(Map<String, dynamic> json) {
//     return AddressData(
//       addresses: (json['addresses'] as List)
//           .map((e) => EstateAddress.fromJson(e))
//           .toList(),
//       total: json['total'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'addresses': addresses.map((e) => e.toJson()).toList(),
//         'total': total,
//       };
// }

// class EstateAddress {
//   final int id;
//   final String label;
//   final String type;
//   final String streetName;
//   final String streetNumber;
//   final String blockNumber;
//   final String flatNumber;
//   final String buildingName;

//   EstateAddress({
//     required this.id,
//     required this.label,
//     required this.type,
//     required this.streetName,
//     required this.streetNumber,
//     required this.blockNumber,
//     required this.flatNumber,
//     required this.buildingName,
//   });

//   factory EstateAddress.fromJson(Map<String, dynamic> json) {
//     return EstateAddress(
//       id: json['id'],
//       label: json['label'],
//       type: json['type'],
//       streetName: json['street_name'],
//       streetNumber: json['street_number'],
//       blockNumber: json['block_number'],
//       flatNumber: json['flat_number'],
//       buildingName: json['building_name'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'label': label,
//         'type': type,
//         'street_name': streetName,
//         'street_number': streetNumber,
//         'block_number': blockNumber,
//         'flat_number': flatNumber,
//         'building_name': buildingName,
//       };
// }
