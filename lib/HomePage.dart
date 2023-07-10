import 'dart:convert';
import 'package:flutter/material.dart';
import 'JsonData.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final recipes = _parseRecipes(jsonString);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recipe App'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: Container(
                height: 26,
                width: 26,
                child: const Icon(Icons.fastfood)),
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }

  List<Recipe> _parseRecipes(String json) {
    final parsedJson = jsonDecode(json);
    final List<dynamic> recipeList = parsedJson['recipes'];

    return recipeList.map((json) => Recipe.fromJson(json)).toList();
  }
}

