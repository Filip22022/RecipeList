import 'package:flutter/material.dart';
import 'package:recipe_list/views/widgets/recipe_card.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<Recipe> recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    // recipes = await RecipeApi.getRecipes();
    recipes = await RecipeApi.getRecipesFromFile();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Recipe'),
        ],),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                  recipe: recipes[index]
              );
            },
      )
    );
  }
}