class ViolationCategoryResponse {
  final bool status;
  final String message;
  final int code;
  final CategoryData data;

  ViolationCategoryResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory ViolationCategoryResponse.fromJson(Map<String, dynamic> json) =>
      ViolationCategoryResponse(
        status: json['status'],
        message: json['message'],
        code: json['code'],
        data: CategoryData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'code': code,
        'data': data.toJson(),
      };
}

class CategoryData {
  final List<Category> categories;
  final int total;

  CategoryData({
    required this.categories,
    required this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        categories: List<Category>.from(
          json['categories'].map((x) => Category.fromJson(x)),
        ),
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'categories': categories.map((x) => x.toJson()).toList(),
        'total': total,
      };
}

class Category {
  final int id;
  final int estateId;
  final String type;
  final String name;
  final List<dynamic> subCategories;
  final String description;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.estateId,
    required this.type,
    required this.name,
    required this.subCategories,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        estateId: json['estate_id'],
        type: json['type'],
        name: json['name'],
        subCategories: json['sub_categories'] ?? [],
        description: json['description'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'estate_id': estateId,
        'type': type,
        'name': name,
        'sub_categories': subCategories,
        'description': description,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
