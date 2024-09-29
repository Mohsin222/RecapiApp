import 'package:get/get.dart';
import 'package:testapp2/model/CategoryModel.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';
import 'package:testapp2/service/ReceipeService.dart';

class HomeController extends GetxController {
  final RecipeService recipeService = Get.find<RecipeService>();

  // Observables for managing loading states
  RxBool isLoadingJustForYou = false.obs;
  RxBool isLoadingTrending = false.obs;
  RxBool isLoadingCategories = false.obs;

  // Observables for handling errors
  RxString justForYouError = ''.obs;
  RxString trendingError = ''.obs;
  RxString categoryError = ''.obs;

  // Observables for storing fetched data
  RxList<RecipeModel> justForYouRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> trendingRecipes = <RecipeModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData(); // Fetch all data when the controller is initialized
  }

  // Method to fetch all the necessary data (recipes and categories)
  void fetchAllData() {
    fetchJustForYouRecipes();
    fetchTrendingRecipes();
    fetchCategories();
  }

  // Toggle isLiked for a specific recipe
  void toggleLike(RecipeModel recipe) {
    var recp = justForYouRecipes.firstWhere((val) => val.id == recipe.id);
    var trendingRecp = trendingRecipes.firstWhere((val) => val.id == recipe.id);
    recp.isLiked.value = !recp.isLiked.value;
    trendingRecp.isLiked.value = !trendingRecp.isLiked.value;
  }

  // Fetch "Just For You" recipes
  Future<void> fetchJustForYouRecipes() async {
    isLoadingJustForYou.value = true;
    justForYouError.value = '';

    final ResponseModel<List<RecipeModel>> response =
        await recipeService.fetchJustForYouRecipes();
    isLoadingJustForYou.value = false;

    if (response.isSuccess) {
      justForYouRecipes.value = response.data ?? [];
    } else {
      justForYouError.value =
          response.error ?? 'Error fetching Just For You recipes';
    }
  }

  // Fetch "Trending Recipes"
  Future<void> fetchTrendingRecipes() async {
    isLoadingTrending.value = true;
    trendingError.value = '';

    final ResponseModel<List<RecipeModel>> response =
        await recipeService.fetchTrendingRecipes();
    isLoadingTrending.value = false;

    if (response.isSuccess) {
      trendingRecipes.value = response.data ?? [];
    } else {
      trendingError.value = response.error ?? 'Error fetching Trending Recipes';
    }
  }

  // Fetch categories (e.g., Pizza, Salad, etc.)
  Future<void> fetchCategories() async {
    isLoadingCategories.value = true;
    categoryError.value = '';

    final ResponseModel<List<CategoryModel>> response =
        await recipeService.fetchCategories();
    isLoadingCategories.value = false;

    if (response.isSuccess) {
      categories.value = response.data ?? [];
    } else {
      categoryError.value = response.error ?? 'Error fetching categories';
    }
  }
}
