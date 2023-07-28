import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';

class FavoritesMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealModel newMeal) {
    final isFavoriteMeal = state.contains(newMeal);

    if (isFavoriteMeal) {
      state = state.where((meal) => meal.id != newMeal.id).toList();
      return false;
    } else {
      state = [...state, newMeal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<MealModel>>(
        (ref) => FavoritesMealsNotifier());
