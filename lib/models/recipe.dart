class Recipe {
  final String title;
  final String image;
  final int likes;
  final int time;
  final String description;
  final int healthScore;
  final num pricePerServing;
  final int servings;



  Recipe({
    required this.healthScore,
    required this.pricePerServing,
    required this.servings,
    required this.title,
    required this.image,
    required this.likes,
    required this.time,
    required this.description,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      healthScore: json['healthScore'] as int,
      pricePerServing: json['pricePerServing'] as num,
      servings: json['servings'] as int,
      title: json['title'] as String,
      image: json['image'] as String? ?? '',
      description: json['summary'] as String,
      likes: json['aggregateLikes'] as int,
      time: json['readyInMinutes'] as int);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}