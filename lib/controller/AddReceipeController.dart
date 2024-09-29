import 'dart:io';

import 'package:get/get.dart';
// Import ResponseModel
import 'package:image_picker/image_picker.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';
import 'package:testapp2/service/ReceipeService.dart';

class RecipeAddController extends GetxController {
  RxList<Ingredient> ingredients = <Ingredient>[].obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  final RecipeService recipeService = RecipeService();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addIngredient(); // Start with one ingredient
  }

  // Add an empty ingredient to the list
  void addIngredient() {
    ingredients.add(Ingredient(name: '', quantity: ''));
  }

  // Remove an ingredient at a specific index
  void removeIngredient(int index) {
    if (ingredients.length > 1) {
      ingredients.removeAt(index);
    }
  }

  // Update the name of an ingredient at a specific index
  void updateIngredientName(int index, String newName) {
    ingredients[index] =
        Ingredient(name: newName, quantity: ingredients[index].quantity);
    ingredients.refresh();
  }

  // Update the quantity of an ingredient at a specific index
  void updateIngredientQuantity(int index, String newQuantity) {
    ingredients[index] =
        Ingredient(name: ingredients[index].name, quantity: newQuantity);
    ingredients.refresh();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Function to submit the recipe data
  Future<void> submitRecipe({
    required String title,
    required String description,
  }) async {
    isLoading.value = true;

    final ResponseModel<String> response = await recipeService.uploadRecipe(
      title: title,
      description: description,
      image: selectedImage.value,
      ingredients: ingredients, // Pass the ingredients list
    );

    isLoading.value = false;

    if (response.isSuccess) {
      // Success: Show success message
      Get.snackbar('Success', response.data ?? 'Recipe uploaded successfully');
    } else {
      // Error: Show error message
      Get.snackbar('Error', response.error ?? 'Failed to upload recipe');
    }
  }
}
