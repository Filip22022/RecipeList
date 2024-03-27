class Recipe {
  final String title;
  final String image;
  final int likes;
  final int time;



  Recipe({required this.title, required this.image, required this.likes, required this.time});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      title: json['title'] as String,
      image: json['image'] as String,
      likes: json['aggregateLikes'] as int,
      time: json['cookingMinutes'] as int);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}