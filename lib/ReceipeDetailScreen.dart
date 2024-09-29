import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp2/controller/ReceipeController.dart';
import 'package:testapp2/routes/Routes.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeController controller = Get.put(RecipeController());

  RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adaptive padding and font sizes
    double getAdaptiveSize(double size) => size * (screenWidth / 400);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Recipe'),
      // ),
      body: Obx(
        () {
          final recipe = controller.recipe.value;
          if (recipe == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                // Stack to manage image and overlay content
                ClipPath(
                  clipper: CustomCurveEdge(),
                  child: Stack(
                    children: [
                      Image.network(
                        recipe.image ?? '',
                        width: double.infinity,
                        height: getAdaptiveSize(250),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: getAdaptiveSize(10),
                        left: getAdaptiveSize(16),
                        right: getAdaptiveSize(16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(getAdaptiveSize(50)),
                              child: Image.network(
                                recipe.image ?? '',
                                width: getAdaptiveSize(50),
                                height: getAdaptiveSize(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: getAdaptiveSize(10)),
                            Expanded(
                              child: Text(
                                recipe.user?.name ?? 'Unknown Chef',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getAdaptiveSize(16),
                                ),
                              ),
                            ),
                            SizedBox(width: getAdaptiveSize(10)),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.ADD_RECIPE);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green, // Button color
                                padding: EdgeInsets.symmetric(
                                  vertical: getAdaptiveSize(10),
                                  horizontal: getAdaptiveSize(20),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getAdaptiveSize(20)),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_add_alt,
                                    size: getAdaptiveSize(16),
                                  ),
                                  SizedBox(width: getAdaptiveSize(5)),
                                  Text(
                                    'Follow',
                                    style: TextStyle(
                                        fontSize: getAdaptiveSize(14)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container with rounded borders for the bottom body
                Container(
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black26,
                      //     blurRadius: getAdaptiveSize(10),
                      //     offset: const Offset(0, -5),
                      //   ),
                      // ],
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(getAdaptiveSize(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.recipeTitle ?? '',
                          style: TextStyle(
                            fontSize: getAdaptiveSize(22),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: getAdaptiveSize(8)),
                        Text(
                          recipe.description ?? '',
                          style: TextStyle(
                              fontSize: getAdaptiveSize(16),
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400),
                          // maxLines: 6,
                        ),
                        SizedBox(height: getAdaptiveSize(16)),
                        Text(
                          'Ingredients (${recipe.ingredients?.length ?? 0})',
                          style: TextStyle(
                            fontSize: getAdaptiveSize(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: getAdaptiveSize(8)),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: recipe.ingredients?.length ?? 0,
                          itemBuilder: (context, index) {
                            final ingredient = recipe.ingredients?[index];

                            return IngredientTile(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1481931715705-36f5f79f1f3d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D',
                              name: ingredient?.name ?? '',
                              quantity: ingredient?.quantity ?? '',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class IngredientTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String quantity;

  const IngredientTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adaptive padding and font sizes
    double getAdaptiveSize(double size) => size * (screenWidth / 400);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: getAdaptiveSize(6)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getAdaptiveSize(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: getAdaptiveSize(6),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: getAdaptiveSize(10),
          horizontal: getAdaptiveSize(12),
        ),
        child: Row(
          children: [
            // Ingredient Image
            Image.network(
              imageUrl, // Replace with the actual image URL for the ingredient
              width: getAdaptiveSize(40),
              height: getAdaptiveSize(40),
            ),
            SizedBox(width: getAdaptiveSize(10)),

            // Ingredient Name
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: getAdaptiveSize(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Ingredient Quantity
            Text(
              quantity,
              style: TextStyle(
                fontSize: getAdaptiveSize(16),
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCurveEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final firstLastCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, firstLastCurve.dx, firstLastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 30);

    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
