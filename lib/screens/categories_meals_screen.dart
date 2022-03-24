import 'package:flutter/material.dart';
import '../componentes/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  
  final List<Meal> meals;

  const CategoriesMealsScreen({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    //where é um filtro
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
