import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/recipe.dart';



class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({super.key, required this.recipe});

  ///Widget structure:
  /// Scaffold:
  ///   AppBar:
  ///     Text: title
  ///     IconButton: back
  ///    Column:
  ///     Text: recipe description
  ///
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataTable(
                    columns: [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Value")),
                    ],
                    rows: [
                      DataRow(cells:
                        [
                          DataCell(Text("Health Score")),
                          DataCell(Text(recipe.healthScore.toString())),
                        ],
                      ),
                      DataRow(cells:
                      [
                        DataCell(Text("Servings")),
                        DataCell(Text(recipe.servings.toString())),
                      ],
                      ),
                      DataRow(cells:
                      [
                        DataCell(Text("Serving Cost")),
                        DataCell(Text(recipe.pricePerServing.toString())),
                      ],
                      ),
                    ],
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
