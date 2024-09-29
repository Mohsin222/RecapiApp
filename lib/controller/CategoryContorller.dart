import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';
import 'package:testapp2/service/CategoryService.dart';

class CategoryController extends GetxController {
  RxList<RecipeModel> justForYouRecipes = <RecipeModel>[].obs;
  RxBool isLoadingData = false.obs;
  final CategoryService categoryService = Get.find<CategoryService>();

  // Observables for handling errors
  RxString justForYouError = ''.obs;
  Future<void> fetchJustForYouRecipes({required int categoryId}) async {
    isLoadingData.value = true;
    justForYouError.value = '';

    final ResponseModel<List<RecipeModel>> response =
        await categoryService.categoryProducts(categoryId);
    isLoadingData.value = false;

    if (response.isSuccess) {
      justForYouRecipes.value = response.data ?? [];
    } else {
      justForYouError.value =
          response.error ?? 'Error fetching Just For You recipes';
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchJustForYouRecipes(categoryId: Get.arguments);
  }
}
