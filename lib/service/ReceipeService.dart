import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:testapp2/constant/DummyRecipies.dart';
import 'package:testapp2/model/CategoryModel.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';

class RecipeService {
  // Simulate API call to fetch recipe data
  Future<ResponseModel<RecipeModel>> fetchRecipeFromApi(int id) async {
    // Dummy JSON data (simulating a network response)
    const jsonData = '''
    {
      "image": "https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Chef John",
      "recipeTitle": "Tortilla Pizza Recipe",
      "description": "This tortilla pizza is extremely easy to make. It is light enough to be a snack, serves well as an appetizer, or is so good that it can be devoured alone! You can use any sort of topping variation.",
      "ingredients": [
        {
          "name": "soft flour tortilla",
          "quantity": "1"
        },
        {
          "name": "teaspoon olive oil",
          "quantity": "1"
        },
        {
          "name": "pinch garlic powder",
          "quantity": "1"
        },
        {
          "name": "salt and black pepper",
          "quantity": "10g"
        },
        {
          "name": "tablespoons tomato sauce",
          "quantity": "2"
        }
      ]
    }
    ''';
    var data = DummyRecipies().recipes.firstWhere((val) => val['id'] == id);
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Parse JSON data
    final Map<String, dynamic> jsonMap = json.decode(jsonData);

    // Parse JSON into RecipeModel
    try {
      RecipeModel recipe = RecipeModel.fromJson(data);
      return ResponseModel.success(recipe);
    } catch (e) {
      return ResponseModel.error('Failed to parse recipe data');
    }
  }

  final String _baseUrl =
      "https://your-backend-api.com/recipes"; // Replace with your API URL
  final Dio _dio = Dio(); // Initialize Dio

  // Function to upload the recipe data using Dio
  Future<ResponseModel<String>> uploadRecipe({
    required String title,
    required String description,
    File? image,
    required List<Ingredient> ingredients, // Include the ingredients list
  }) async {
    try {
      // Convert ingredients list to JSON string
      String ingredientsJson = jsonEncode(
        ingredients.map((ingredient) => ingredient.toJson()).toList(),
      );

      // Create the form data
      FormData formData = FormData.fromMap({
        'title': title,
        'description': description,
        'ingredients': ingredientsJson, // Add ingredients to the form data
        // Add image if it exists
        if (image != null)
          'image': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      });

      // Make the POST request
      Response response = await _dio.post(
        _baseUrl,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Handle success
      if (response.statusCode == 200) {
        return ResponseModel.success("Recipe uploaded successfully");
      } else {
        return ResponseModel.error(
            "Failed to upload recipe: ${response.statusMessage}");
      }
    } catch (e) {
      return ResponseModel.error('Failed to upload recipe: $e');
    }
  }

  //home screen
  Future<ResponseModel<List<RecipeModel>>> fetchJustForYouRecipes() async {
    try {
      // Simulated JSON data
      List<Map<String, dynamic>> jsonResponse = [
        {
          "recipeTitle": "15 best pasta recipes from Chef John",
          "image":
              "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlfGVufDB8fDB8fHww",
          "rating": 4.8
        },
        {
          "recipeTitle": "Easy Avocado Salad",
          "image":
              "https://images.unsplash.com/photo-1485921325833-c519f76c4927?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.5
        },
        {
          "recipeTitle": "Grilled Chicken with Veggies",
          "image":
              "https://images.unsplash.com/photo-1519148246701-3dc1897a7a21?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.9
        },
      ];

      // Convert the JSON data to a list of Recipe objects
      List<RecipeModel> recipes = DummyRecipies()
          .recipes
          .map((json) => RecipeModel.homejson(json))
          .toList();
      return ResponseModel.success(recipes);
    } catch (e) {
      return ResponseModel.error("Failed to load Just For You recipes: $e");
    }
  }

  // Fetch trending recipes (simulated dummy data)
  Future<ResponseModel<List<RecipeModel>>> fetchTrendingRecipes() async {
    try {
      // Simulated JSON data
      List<Map<String, dynamic>> jsonResponse = [
        {
          "recipeTitle": "Tortilla Pizza Recipe",
          "image":
              "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.8
        },
        {
          "recipeTitle": "Salmon Sushi Recipe",
          "image":
              "https://images.unsplash.com/photo-1519148246701-3dc1897a7a21?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.7
        },
        {
          "recipeTitle": "Classic Beef Burger",
          "image":
              "https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.6
        },
        {
          "recipeTitle": "Pasta Carbonara",
          "image":
              "https://images.unsplash.com/photo-1722246341860-c26e7347108c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHJlY2lwZXxlbnwwfHwwfHx8MA%3D%3D",
          "rating": 4.9
        },
      ];

      // Convert the JSON data to a list of Recipe objects
      List<RecipeModel> recipes = DummyRecipies()
          .recipes
          .map((json) => RecipeModel.homejson(json))
          .toList();
      return ResponseModel.success(recipes);
    } catch (e) {
      return ResponseModel.error("Failed to load Trending recipes: $e");
    }
  }

  // Fetch categories (simulated dummy data)
  Future<ResponseModel<List<CategoryModel>>> fetchCategories() async {
    try {
      // Simulated JSON data
      List<Map<String, dynamic>> jsonResponse = [
        {
          'id': 0,
          "name": "Pizza",
          "image":
              "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D"
        },
        {
          'id': 1,
          "name": "Salad",
          "image":
              "https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D"
        },
        {
          'id': 2,
          "name": "Burgers",
          "image":
              "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
        },
        {
          'id': 3,
          "name": "Pasta",
          "image":
              "https://images.unsplash.com/photo-1473093226795-af9932fe5856?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fFBhc3RhfGVufDB8fDB8fHww"
        },
      ];

      // Convert the JSON data to a list of Category objects
      List<CategoryModel> categories =
          jsonResponse.map((json) => CategoryModel.fromJson(json)).toList();
      return ResponseModel.success(categories);
    } catch (e) {
      return ResponseModel.error("Failed to load categories: $e");
    }
  }
}
