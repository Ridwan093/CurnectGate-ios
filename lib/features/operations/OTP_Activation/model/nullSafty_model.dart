abstract class NullSafetyHelper {
  // Primitive types
  static String safeString(dynamic value) => value?.toString() ?? '';
  
  static int safeInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }
  
  static double safeDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? 0.0;
  }
  
  static bool safeBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      return value.toLowerCase() == 'true' || value == '1';
    }
    return false;
  }

  // Complex types
  static DateTime safeDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }
  
  static List<T> safeList<T>(dynamic value) {
    if (value == null) return <T>[];
    if (value is List) return List<T>.from(value.whereType<T>());
    return <T>[];
  }
  static List<String> safeStringList(dynamic value) {
  if (value == null || value is! List) return [];
  return value.map((e) => e.toString()).toList();
}

  
  static Map<String, dynamic> safeMap(dynamic value) {
    if (value == null) return {};
    if (value is Map) return Map<String, dynamic>.from(value);
    return {};
  }

  // Special handling for your models
  static T? safeModel<T>(
  dynamic value,
  T Function(Map<String, dynamic>) creator,
  T? emptyValue,
) {
  if (value == null) return emptyValue;
  if (value is T) return value;
  try {
    return creator(safeMap(value));
  } catch (e) {
    return emptyValue;
  }
}

}