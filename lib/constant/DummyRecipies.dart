import 'package:testapp2/model/ReceipeModel.dart';

class DummyRecipies {
  var recipes = [
    {
      'id': 1,
      "image":
          "https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njd8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "John Smith",
      "recipeTitle": "Spaghetti Carbonara",
      'rating': 3.2,
      'isLiked': false,
      "description":
          "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
      "ingredients": [
        {"name": "Spaghetti", "quantity": "200g"},
        {"name": "Pancetta", "quantity": "100g"},
        {"name": "Eggs", "quantity": "2 large"},
        {"name": "Parmesan Cheese", "quantity": "50g"},
        {"name": "Black Pepper", "quantity": "1 tsp"},
      ],
      'category': {
        'id': 0,
        "name": "Pizza",
        "image":
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D"
      },
      "user": {
        "id": 1,
        "name": "John Smith",
        "profilePicture": "https://example.com/profile.jpg",
        "bio": null
      },
    },
    {
      'id': 2,
      "image":
          "https://images.unsplash.com/photo-1478900799953-bf09659cc42e?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Emily Davis",
      "recipeTitle": "Grilled Chicken Salad",
      'rating': 3.2,
      'isLiked': false,
      "description":
          "A healthy and delicious salad with grilled chicken, fresh vegetables, and a light dressing.",
      "ingredients": [
        {"name": "Chicken Breast", "quantity": "150g"},
        {"name": "Mixed Greens", "quantity": "100g"},
        {"name": "Cherry Tomatoes", "quantity": "50g"},
        {"name": "Cucumber", "quantity": "1/2 sliced"},
        {"name": "Olive Oil", "quantity": "2 tbsp"}
      ],
      'category': {
        'id': 1,
        "name": "Salad",
        "image":
            "https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D"
      },
      "user": {
        "id": 1,
        "name": "John Smith",
        "profilePicture": "https://example.com/profile.jpg",
        "bio": null
      }
    },
    {
      'id': 3,
      "image":
          "https://plus.unsplash.com/premium_photo-1663852705829-aa8707495e2e?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Michael Lee",
      "recipeTitle": "Avocado Toast",
      'rating': 3.2,
      'isLiked': false,
      "description":
          "A simple yet flavorful avocado toast with a hint of lime and chili flakes.",
      "ingredients": [
        {"name": "Bread", "quantity": "2 slices"},
        {"name": "Avocado", "quantity": "1 large"},
        {"name": "Lime Juice", "quantity": "1 tbsp"},
        {"name": "Chili Flakes", "quantity": "1/2 tsp"},
        {"name": "Salt", "quantity": "to taste"}
      ],
      'category': {
        'id': 1,
        "name": "Salad",
        "image":
            "https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D"
      },
      "user": {
        "id": 1,
        "name": "John Smith",
        "profilePicture": "https://example.com/profile.jpg",
        "bio": null
      }
    },
    {
      'id': 4,
      "image":
          "https://images.unsplash.com/photo-1492016775777-ed98c058f826?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODJ8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Sophia Martinez",
      "recipeTitle": "Vegan Buddha Bowl",
      'rating': 3.6,
      'isLiked': true,
      "description":
          "A nourishing vegan Buddha bowl with quinoa, chickpeas, and a variety of roasted vegetables.",
      "ingredients": [
        {"name": "Quinoa", "quantity": "100g"},
        {"name": "Chickpeas", "quantity": "1 can"},
        {"name": "Sweet Potato", "quantity": "1 large"},
        {"name": "Broccoli", "quantity": "100g"},
        {"name": "Tahini", "quantity": "2 tbsp"}
      ],
      'category': {
        'id': 0,
        "name": "Pizza",
        "image":
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D"
      },
    },
    {
      'id': 5,
      "image":
          "https://images.unsplash.com/photo-1508615263227-c5d58c1e5821?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODR8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "David Wilson",
      "recipeTitle": "Beef Tacos",
      'rating': 3.8,
      'isLiked': true,
      "description": "Delicious beef tacos with homemade salsa and guacamole.",
      "ingredients": [
        {"name": "Ground Beef", "quantity": "200g"},
        {"name": "Taco Shells", "quantity": "4 shells"},
        {"name": "Salsa", "quantity": "50g"},
        {"name": "Guacamole", "quantity": "50g"},
        {"name": "Cheddar Cheese", "quantity": "50g"}
      ],
      'category': {
        'id': 1,
        "name": "Salad",
        "image":
            "https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D"
      },
    },
    {
      'id': 6,
      "image":
          "https://images.unsplash.com/photo-1505253213348-ce3e0ff1f0cc?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODh8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Jessica White",
      "recipeTitle": "Homemade Pizza",
      'rating': 2.2,
      'isLiked': true,
      "description":
          "A delicious homemade pizza with fresh tomatoes, mozzarella, and basil.",
      "ingredients": [
        {"name": "Pizza Dough", "quantity": "1 large"},
        {"name": "Tomato Sauce", "quantity": "100g"},
        {"name": "Mozzarella Cheese", "quantity": "150g"},
        {"name": "Fresh Basil", "quantity": "10 leaves"},
        {"name": "Olive Oil", "quantity": "1 tbsp"}
      ],
      'category': {
        'id': 0,
        "name": "Pizza",
        "image":
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D"
      },
    },
    {
      'id': 7,
      "image":
          "https://images.unsplash.com/photo-1443131612988-32b6d97cc5da?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTR8fGZvb2R8ZW58MHx8MHx8fDA%3D",
      "chefName": "Carlos Gomez",
      "recipeTitle": "Shrimp Scampi",
      'rating': 2.2,
      "description":
          "A classic Italian shrimp scampi with garlic, butter, and white wine sauce.",
      "ingredients": [
        {"name": "Shrimp", "quantity": "200g"},
        {"name": "Garlic", "quantity": "3 cloves"},
        {"name": "Butter", "quantity": "50g"},
        {"name": "White Wine", "quantity": "1/4 cup"},
        {"name": "Parsley", "quantity": "1 tbsp"}
      ],
      'category': {
        'id': 0,
        "name": "Pizza",
        "image":
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D"
      },
    },
    {
      'id': 8,
      "image":
          "https://images.unsplash.com/photo-1483137140003-ae073b395549?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAyfHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Lily Taylor",
      "recipeTitle": "French Toast",
      'rating': 3.2,
      "description":
          "A simple and tasty French toast with maple syrup and powdered sugar.",
      "ingredients": [
        {"name": "Bread", "quantity": "2 slices"},
        {"name": "Eggs", "quantity": "2 large"},
        {"name": "Milk", "quantity": "1/4 cup"},
        {"name": "Maple Syrup", "quantity": "to taste"},
        {"name": "Powdered Sugar", "quantity": "to taste"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 9,
      "image":
          "https://images.unsplash.com/photo-1499778003268-cbafc6d08bab?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEwfHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Isabella Clark",
      "recipeTitle": "Pancakes with Berries",
      'rating': 2.2,
      "description": "Fluffy pancakes served with fresh berries and honey.",
      "ingredients": [
        {"name": "Flour", "quantity": "1 cup"},
        {"name": "Eggs", "quantity": "2 large"},
        {"name": "Milk", "quantity": "1 cup"},
        {"name": "Mixed Berries", "quantity": "100g"},
        {"name": "Honey", "quantity": "to taste"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 10,
      "image":
          "https://images.unsplash.com/photo-1464347477106-7648bc26261b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEyfHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Oliver Harris",
      'rating': 4.2,
      "recipeTitle": "BBQ Chicken Wings",
      "description": "Juicy BBQ chicken wings with a smoky, tangy sauce.",
      "ingredients": [
        {"name": "Chicken Wings", "quantity": "500g"},
        {"name": "BBQ Sauce", "quantity": "100g"},
        {"name": "Garlic Powder", "quantity": "1 tsp"},
        {"name": "Smoked Paprika", "quantity": "1 tsp"},
        {"name": "Salt", "quantity": "to taste"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 11,
      "image":
          "https://images.unsplash.com/photo-1426869884541-df7117556757?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTIzfHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Sophia Miller",
      "recipeTitle": "Chocolate Chip Cookies",
      'rating': 4.2,
      "description":
          "Classic chocolate chip cookies with a crispy edge and chewy center.",
      "ingredients": [
        {"name": "Flour", "quantity": "2 cups"},
        {"name": "Butter", "quantity": "100g"},
        {"name": "Sugar", "quantity": "1/2 cup"},
        {"name": "Chocolate Chips", "quantity": "1 cup"},
        {"name": "Vanilla Extract", "quantity": "1 tsp"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 12,
      "image":
          "https://images.unsplash.com/photo-1436327266874-c2e4e1ac7a97?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM1fHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Emily Brown",
      "recipeTitle": "Grilled Salmon",
      'rating': 1.0,
      "description":
          "A perfectly grilled salmon fillet served with a lemon butter sauce.",
      "ingredients": [
        {"name": "Salmon Fillet", "quantity": "200g"},
        {"name": "Lemon", "quantity": "1"},
        {"name": "Butter", "quantity": "50g"},
        {"name": "Garlic", "quantity": "2 cloves"},
        {"name": "Parsley", "quantity": "1 tbsp"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 13,
      "image":
          "https://images.unsplash.com/photo-1502550900787-e956c314a221?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTU2fHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Lucas Thompson",
      "recipeTitle": "Stuffed Bell Peppers",
      'rating': 1.0,
      "description":
          "Colorful bell peppers stuffed with rice, vegetables, and ground beef.",
      "ingredients": [
        {"name": "Bell Peppers", "quantity": "4 large"},
        {"name": "Ground Beef", "quantity": "200g"},
        {"name": "Rice", "quantity": "1 cup"},
        {"name": "Onion", "quantity": "1 small"},
        {"name": "Cheddar Cheese", "quantity": "50g"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 14,
      "image":
          "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTcwfHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Mason Anderson",
      "recipeTitle": "Beef Stir-Fry",
      'rating': 4.9,
      "description":
          "A quick and healthy beef stir-fry with vegetables and soy sauce.",
      "ingredients": [
        {"name": "Beef Strips", "quantity": "200g"},
        {"name": "Soy Sauce", "quantity": "2 tbsp"},
        {"name": "Bell Peppers", "quantity": "1 large"},
        {"name": "Carrots", "quantity": "1 large"},
        {"name": "Ginger", "quantity": "1 tsp"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    },
    {
      'id': 15,
      "image":
          "https://plus.unsplash.com/premium_photo-1672363353881-68c8ff594e25?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg1fHxmb29kfGVufDB8fDB8fHww",
      "chefName": "Liam Davis",
      'rating': 4.7,
      "recipeTitle": "Vegetable Soup",
      "description":
          "A hearty vegetable soup with carrots, potatoes, and celery.",
      "ingredients": [
        {"name": "Carrots", "quantity": "2 large"},
        {"name": "Potatoes", "quantity": "2 medium"},
        {"name": "Celery", "quantity": "2 stalks"},
        {"name": "Vegetable Broth", "quantity": "4 cups"},
        {"name": "Tomatoes", "quantity": "2 large"}
      ],
      'category': {
        'id': 2,
        "name": "Burgers",
        "image":
            "https://images.unsplash.com/photo-1521305916504-4a1121188589?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"
      },
    }
  ];

  // Corrected function to fetch recipes by category ID
  List<RecipeModel> getRecipesByCategoryId(int categoryId) {
    var data = recipes.map((json) => RecipeModel.homejson(json)).toList();
    List<RecipeModel> filterData = [];
    for (var i = 0; i < data.length; i++) {
      if (categoryId == data[i].category!.id) {
        filterData.add(data[i]);
      }
    }

    return filterData;
  }
}
