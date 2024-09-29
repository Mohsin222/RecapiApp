import 'package:get/get.dart';
import 'package:testapp2/AddReceipeScreen.dart';
import 'package:testapp2/HomeScreen.dart';
import 'package:testapp2/ReceipeDetailScreen.dart';
import 'package:testapp2/RecipeIntroScreen.dart';
import 'package:testapp2/binding/ReceipeBinding.dart';
import 'package:testapp2/routes/Routes.dart';
import 'package:testapp2/views/CategoryProductsScreen.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: Routes.Splash,
      page: () => const RecipeIntroScreen(), // Assuming there's a HomeScreen
      binding: RecipeBinding(), // Assuming there's a corresponding HomeBinding
    ),
    GetPage(
      name: Routes.RECIPE,
      page: () => RecipeScreen(),
      binding: RecipeBinding(),
    ),
    GetPage(
      name: Routes.ADD_RECIPE,
      page: () => RecipeAddScreen(),
      binding: RecipeBinding(),
    ),
    GetPage(
      name: Routes.Home,
      page: () => HomeScreen(),
      binding: RecipeBinding(),
    ),
 
    GetPage(
      name: Routes.categoryProductScreen,
      page: () => CategoryProductScreen(),
      binding: RecipeBinding(),
    ),
  ];
}
