import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) onIsFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.onIsFavorite);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 320,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: onIsFavorite(meal) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
