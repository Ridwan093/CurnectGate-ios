class Reports {
  final String? category;
  final String? description;
  final String? imagePaths;
  final String? files;
  final bool? isAnonymous;
  final String? path;
  final String? name;
  final int? size;
  final String? type;


  const Reports({
    this.category,
    this.description,
    this.files,
    this.imagePaths,
    this.name,
    this.isAnonymous,
    this.path,
    this.size,
    this.type,
  });

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
