class CategoryModel {
  final int id;
  final String? name;
  final String? image;

  CategoryModel({
    required this.id,
    this.name,
    this.image,
  });

  // Factory constructor to parse JSON data
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
