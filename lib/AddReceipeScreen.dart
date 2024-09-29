import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testapp2/controller/AddReceipeController.dart';

class RecipeAddScreen extends StatelessWidget {
  final RecipeAddController controller = Get.put(RecipeAddController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RecipeAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Helper to adapt sizes based on screen width
    double getAdaptiveSize(double size) => size * (screenWidth / 400);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(getAdaptiveSize(16)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Title Input
              Text(
                'Recipe Title',
                style: TextStyle(
                  fontSize: getAdaptiveSize(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getAdaptiveSize(10)),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getAdaptiveSize(12)),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintText: 'Enter Recipe Title',
                ),
              ),
              SizedBox(height: getAdaptiveSize(20)),

              // Recipe Description Input
              Text(
                'Recipe Description',
                style: TextStyle(
                  fontSize: getAdaptiveSize(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getAdaptiveSize(10)),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getAdaptiveSize(12)),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintText: 'Enter Recipe Description',
                ),
              ),
              SizedBox(height: getAdaptiveSize(20)),

              // Image Section
              Text(
                'Add Image',
                style: TextStyle(
                  fontSize: getAdaptiveSize(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getAdaptiveSize(10)),

              // Display Selected Image or Placeholder
              Obx(() {
                return Center(
                  child: controller.selectedImage.value == null
                      ? Container(
                          height: getAdaptiveSize(150),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(getAdaptiveSize(12)),
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(
                            Icons.image,
                            size: getAdaptiveSize(50),
                            color: Colors.grey.shade400,
                          ),
                        )
                      : Container(
                          height: getAdaptiveSize(150),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(getAdaptiveSize(12)),
                            image: DecorationImage(
                              image: FileImage(controller.selectedImage.value!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                );
              }),

              // Image Picker Buttons
              SizedBox(height: getAdaptiveSize(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => controller.pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Gallery'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getAdaptiveSize(10)),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => controller.pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Camera'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getAdaptiveSize(10)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getAdaptiveSize(20)),

              Obx(() {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              child: Column(
                                children: [
                                  // Ingredient Name Input Field
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) =>
                                              controller.updateIngredientName(
                                                  index, value),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Ingredient Name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  // Ingredient Quantity Input Field
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) => controller
                                              .updateIngredientQuantity(
                                                  index, value),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Quantity',
                                          ),
                                        ),
                                      ),
                                      // Remove Ingredient Button
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle,
                                            color: Colors.red),
                                        onPressed: () {
                                          controller.removeIngredient(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    // Add Ingredient Button
                    OutlinedButton.icon(
                      onPressed: controller.addIngredient,
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text(
                        'Add Ingredient',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(color: Colors.green),
                      ),
                    ),
                  ],
                );
              }),

              // Submit Button
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.submitRecipe(
                          title: titleController.text,
                          description: descriptionController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: getAdaptiveSize(15),
                          horizontal: getAdaptiveSize(50),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(getAdaptiveSize(10)),
                        ),
                      ),
                      child: const Text('Submit Recipe'),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
