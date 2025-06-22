class Reports {
  final String category;
  final String description;
  final String imagePaths; // Key is index, value is path
  final String files; // Key is index, value is file
  final bool isAnonymous;
  final String path;
  final String name;
  final int size;
  final String type;

  const Reports({ required   this.category, required this.description,required   this.files, required this.imagePaths,required   this.name, required this.isAnonymous,required   this.path, required this.size,required   this.type,});

  Reports copyWith({
    String? category,
    String? description,
    String? imagePaths,
    String? files,
    bool? isAnonymous,
    String? path,
    String? name,
    int? size,
    String? type,
  }) {
    return Reports(
      name: name ?? this.name,
      size: size ?? this.size,
      type: type ?? this.type,
      path: path ?? this.path,
      category: category ?? this.category,
      description: description ?? this.description,
      imagePaths: imagePaths ?? this.imagePaths,
      files: files ?? this.files,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
