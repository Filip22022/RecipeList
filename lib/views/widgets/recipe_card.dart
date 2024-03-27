import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.dart';
import 'package:recipe_list/views/widgets/recipe_details.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe
  });

  /// Widget structure:
  /// Container:
  ///   Stack:
  ///     Align: Text
  ///     Row:
  ///       Container:
  ///         Icon,
  ///         Text: rating
  ///       Container:
  ///         Icon,
  ///         Text: cookingTime

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipe)),
        );
      },
      child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
            ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.multiply,
          ),
          image: NetworkImage(recipe.image),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                recipe.title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 padding: const EdgeInsets.all(10),
                 margin: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     color: Colors.black.withOpacity(0.5),
                     borderRadius: BorderRadius.circular(15)
                 ),
                 child: Row(
                   children: [
                     const Icon(
                       Icons.star,
                       color: Colors.yellow,
                       size: 18,
                     ),
                     const SizedBox(width: 7),
                     Text(recipe.likes.toString(),
                       style: const TextStyle(
                         fontSize: 19,
                         color: Colors.white,
                       ),),
                   ],
                 ),
               ),
               Container(
                 padding: const EdgeInsets.all(10),
                 margin: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: Colors.black.withOpacity(0.5),
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: Row(
                   children: [
                     const Icon(
                       Icons.schedule,
                       color: Colors.white,
                       size: 18,
                     ),
                     const SizedBox(width: 7),
                     Text(recipe.time.toString(),
                       style: const TextStyle(
                         fontSize: 19,
                         color: Colors.white,
                       ),)
                   ],
                 ),
               ),
             ],
            ),
          ),
        ],
      ),
    )
    );
  }
}