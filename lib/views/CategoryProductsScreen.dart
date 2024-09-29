import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp2/ReceipeDetailScreen.dart';
import 'package:testapp2/controller/CategoryContorller.dart';
import 'package:testapp2/model/CategoryModel.dart';
import 'package:testapp2/model/ReceipeModel.dart';

class CategoryProductScreen extends StatelessWidget {
  CategoryController controller = Get.find<CategoryController>();

  CategoryProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double getAdaptiveSize(double size) => size * (screenWidth / 400);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getAdaptiveSize(16), vertical: getAdaptiveSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Trending Recipes" Section
                Obx(() {
                  if (controller.isLoadingData.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.justForYouError.isNotEmpty) {
                    return Text(controller.justForYouError.value,
                        style: const TextStyle(color: Colors.red));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trending Recipes',
                            style: TextStyle(
                                fontSize: getAdaptiveSize(18),
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: getAdaptiveSize(12)),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: getAdaptiveSize(12),
                            mainAxisSpacing: getAdaptiveSize(12),
                            childAspectRatio: 0.75,
                          ),
                          itemCount: controller.justForYouRecipes.length,
                          itemBuilder: (context, index) {
                            return _buildRecipeCard(
                                controller.justForYouRecipes[index]);
                          },
                        ),
                      ],
                    );
                  }
                }),

                SizedBox(height: getAdaptiveSize(24)),

                // Bottom Category Menu
                // Obx(() {
                //   if (controller.isLoadingCategories.value) {
                //     return const Center(child: CircularProgressIndicator());
                //   } else if (controller.categoryError.isNotEmpty) {
                //     return Text(controller.categoryError.value,
                //         style: const TextStyle(color: Colors.red));
                //   } else {
                //     return SizedBox(
                //       height: getAdaptiveSize(90),
                //       child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: controller.categories.length,
                //         itemBuilder: (context, index) {
                //           return _buildCategoryItem(
                //               controller.categories[index]);
                //         },
                //       ),
                //     );
                //   }
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build recipe cards
  Widget _buildRecipeCard(RecipeModel recipe) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RecipeScreen(), arguments: recipe.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                recipe.image!,
                width: Get.width * 0.8,
                fit: BoxFit.cover,
                height: Get.height,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    recipe.recipeTitle!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build category items
  // Helper function to build category items
  Widget _buildCategoryItem(CategoryModel category) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        children: [
          // Use the CategoryImage widget
          CategoryImage(imageUrl: category.image!),
          const SizedBox(height: 8),
          Text(category.name!),
        ],
      ),
    );
  }
}

class CategoryImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CategoryImage({
    super.key,
    required this.imageUrl,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
