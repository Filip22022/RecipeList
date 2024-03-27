import 'dart:convert';
import 'package:flutter/services.dart';
import "package:recipe_list/models/recipe.dart";
import 'package:http/http.dart' as http;

class RecipeApi {
  static var amount = "10";

  // Get *amount* of random recipes from api
  // https://rapidapi.com/spoonacular/api/recipe-food-nutrition/
  static Future<List<Recipe>> getRecipes() async {
    var uri = Uri.https('spoonacular-recipe-food-nutrition-v1.p.rapidapi.com', '/recipes/random',
        {"number": amount, "limitLicense": "true"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "1be082b8dmsh89a67a476a9fe0cp15bde3jsna68b1b57705d",
      "x-rapidapi-host": "poonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['recipes']) {
      temp.add(i);
    }

    return Recipe.recipesFromSnapshot(temp);
  }

  static Future<List<Recipe>> getRecipesFromFile()  async {
    String jsonString = await rootBundle.loadString('lib/models/recipes.json');
    List<dynamic> recipesJson = json.decode(jsonString)['recipes'];
    List temp = [];
    for (var i in recipesJson) {
      temp.add(i);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}