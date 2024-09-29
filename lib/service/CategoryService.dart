import 'package:testapp2/constant/DummyRecipies.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/model/ResponseModel.dart';

class CategoryService {
  // Fetch categories (simulated dummy data)

  Future<ResponseModel<List<RecipeModel>>> categoryProducts(int id) async {
    try {
      DummyRecipies recipies = DummyRecipies();
      // Create Dio instance
      // Dio dio = Dio();

      // Placeholder for the API call (comment this out while using dummy data)
      // final response = await dio.get('https://api.example.com/category/$id');
      // if (response.statusCode == 200) {
      //   List<dynamic> data = response.data; // Data from API
      //   List<RecipeModel> recipes = data.map((json) => RecipeModel.fromJson(json)).toList();
      //   return ResponseModel.success(recipes);
      // } else {
      //   return ResponseModel.error("Failed to load data from API");
      // }

      var data = DummyRecipies().getRecipesByCategoryId(id);

      return ResponseModel.success(data);
    } catch (e) {
      return ResponseModel.error("Failed to load categories: $e");
    }
  }
}
