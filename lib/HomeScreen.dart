import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp2/controller/HomeController.dart';
import 'package:testapp2/model/CategoryModel.dart';
import 'package:testapp2/model/ReceipeModel.dart';
import 'package:testapp2/routes/Routes.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double getAdaptiveSize(double size) => size * (screenWidth / 400);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 14, 146, 18),
        onPressed: () {
          Get.toNamed(Routes.ADD_RECIPE);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getAdaptiveSize(16), vertical: getAdaptiveSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover Best Recipes',
                      style: TextStyle(
                          fontSize: getAdaptiveSize(24),
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    CircleAvatar(
                      radius: getAdaptiveSize(22),
                      backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fHVzZXJ8ZW58MHx8MHx8fDA%3D'),
                    ),
                  ],
                ),
                SizedBox(height: getAdaptiveSize(16)),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(getAdaptiveSize(12)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getAdaptiveSize(16)),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: 'Search here...',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(height: getAdaptiveSize(24)),

                // "Just For You" Section
                Obx(() {
                  if (controller.isLoadingJustForYou.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.justForYouError.isNotEmpty) {
                    return Text(controller.justForYouError.value,
                        style: const TextStyle(color: Colors.red));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Just For You',
                            style: TextStyle(
                                fontSize: getAdaptiveSize(18),
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: getAdaptiveSize(12)),
                        SizedBox(
                          height: getAdaptiveSize(180),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.justForYouRecipes.length,
                            itemBuilder: (context, index) {
                              return _buildRecipeCard(
                                  controller.justForYouRecipes[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
                SizedBox(height: getAdaptiveSize(24)),
                SizedBox(height: getAdaptiveSize(24)),

                // Bottom Category Menu
                Obx(() {
                  if (controller.isLoadingCategories.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.categoryError.isNotEmpty) {
                    return Text(controller.categoryError.value,
                        style: const TextStyle(color: Colors.red));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories',
                            style: TextStyle(
                                fontSize: getAdaptiveSize(18),
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: getAdaptiveSize(12)),
                        SizedBox(
                          height: getAdaptiveSize(100),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              return _buildCategoryItem(
                                  controller.categories[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
                // "Trending Recipes" Section
                Obx(() {
                  if (controller.isLoadingTrending.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.trendingError.isNotEmpty) {
                    return Text(controller.trendingError.value,
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
                          itemCount: controller.trendingRecipes.length,
                          itemBuilder: (context, index) {
                            return _buildRecipeCard(
                                controller.trendingRecipes[index]);
                          },
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: ClipPath(
          clipper: BottomNavClipper(),
          child: Container(
            height: 90, // Make the bottom bar broad
            decoration: const BoxDecoration(
                // color: Colors.white.withOpacity(0.1),
                ),
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Glassy effect
              child: Container(
                decoration: const BoxDecoration(
                  // color:
                  // Colors.white.withOpacity(0.2), // Semi-transparent white
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  // border: Border.all(
                  //   color: Colors.white.withOpacity(0.3), // Optional border
                  //   width: 1.5,
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(CupertinoIcons.heart, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.fastfood_rounded,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.person, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
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
        // Get.to(() => RecipeScreen(), arguments: recipe.id);

        Get.toNamed(Routes.RECIPE, arguments: recipe.id);
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
              Positioned(
                  right: 0,
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.toggleLike(recipe);
                        },
                        child: Icon(
                          CupertinoIcons.heart_circle,
                          color:
                              recipe.isLiked.value ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build category items
  // Helper function to build category items
  Widget _buildCategoryItem(CategoryModel category) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.categoryProductScreen, arguments: category.id);
      },
      child: Padding(
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

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    double fabSize = 70; // Size of the FAB notch

    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
        size.width * 0.4, 0, size.width * 0.4, fabSize * 0.2);
    path.arcToPoint(
      Offset(size.width * 0.6, fabSize * 0.2),
      radius: Radius.circular(fabSize * 0.4),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
