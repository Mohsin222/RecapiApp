import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:testapp2/model/CategoryModel.dart';
import 'package:testapp2/model/UserModel.dart';

class RecipeModel {
  final String? image;
  final String? chefName;
  final String? recipeTitle;
  final String? description;
  final List<Ingredient>? ingredients;
  final double? rating;
  final int? id;
  final CategoryModel? category;
  final User? user;
  RxBool isLiked = false.obs; // Using GetX's RxBool for reactivity

  RecipeModel({
    this.id,
    this.image,
    this.chefName,
    this.recipeTitle,
    this.description,
    this.ingredients,
    this.rating,
    this.category,
    this.user,
    bool? isLiked,
  }) {
    this.isLiked.value = isLiked ?? false; // Initialize isLiked if provided
  }

  // JSON factory to parse data
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    var ingredientList = json['ingredients'] as List;
    List<Ingredient> ingredients =
        ingredientList.map((i) => Ingredient.fromJson(i)).toList();

    return RecipeModel(
      id: json['id'] ?? 0,
      image: json['image'] ??
          'https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njd8fGZvb2R8ZW58MHx8MHx8fDA%3D',
      chefName: json['chefName'] ?? '',
      recipeTitle: json['recipeTitle'] ?? '',
      description: json['description'] ?? '',
      ingredients: ingredients,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      isLiked:
          json['isLiked'] ?? false, // Initialize isLiked from JSON if available
    );
  }

  factory RecipeModel.homejson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      image: json['image'] ??
          'https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njd8fGZvb2R8ZW58MHx8MHx8fDA%3D',
      chefName: json['chefName'] ?? '',
      recipeTitle: json['recipeTitle'] ?? '',
      rating: json['rating'] ?? '',
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      isLiked: json['isLiked'] ?? false, // Handle for homejson method as well
    );
  }
}

class Ingredient {
  final String? name;
  final String? quantity;

  Ingredient({
    this.name,
    this.quantity,
  });

  // JSON factory to parse data
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  // Convert Ingredient object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
