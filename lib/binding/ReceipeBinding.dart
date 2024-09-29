import 'package:get/get.dart';
import 'package:testapp2/controller/AddReceipeController.dart';
import 'package:testapp2/controller/CategoryContorller.dart';
import 'package:testapp2/controller/ReceipeController.dart';
import 'package:testapp2/service/CategoryService.dart';
import 'package:testapp2/service/ReceipeService.dart';

class RecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeService>(() => RecipeService());

    Get.lazyPut<RecipeController>(() => RecipeController());
    Get.lazyPut<RecipeAddController>(() => RecipeAddController());

    Get.lazyPut<CategoryService>(() => CategoryService());
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
