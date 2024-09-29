import 'package:get/get.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';
import 'package:testapp2/service/ReceipeService.dart';

class RecipeController extends GetxController {
  Rx<RecipeModel?> recipe = Rx<RecipeModel?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  final RecipeService recipeService = RecipeService();

  @override
  void onInit() {
    super.onInit();
    fetchRecipe(Get.arguments);
  }

  void fetchRecipe(int id) async {
    isLoading.value = true;
    errorMessage.value = '';

    // Fetch recipe from the service
    ResponseModel<RecipeModel> response =
        await recipeService.fetchRecipeFromApi(id);

    if (response.isSuccess) {
      recipe.value = response.data; // Update the recipe with fetched data
    } else {
      errorMessage.value = response.error ?? 'An unknown error occurred';
    }

    isLoading.value = false;
  }
}
