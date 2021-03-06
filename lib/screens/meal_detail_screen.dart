import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  final Function(String) toggleFavorite;
  final Function(String) isMealFavorite;

  const MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.name),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, mealId),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionContent(selectedMeal.ingredients, false),
            buildSectionTitle(context, 'Steps'),
            buildSectionContent(selectedMeal.steps, true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  ListView buildSectionContent(List<String> contents, bool useIterator) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contents.length,
      itemBuilder: (context, index) => buildSectionItem(
        context,
        contents[index],
        useIterator: useIterator,
        iterator: (index + 1),
      ),
    );
  }

  Widget buildSectionItem(BuildContext context, String text,
      {bool useIterator = false, int iterator = 0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 25,
      ),
      child: Column(
        children: [
          ListTile(
            dense: true,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: useIterator
                ? Colors.transparent
                : Theme.of(context).accentColor,
            leading: useIterator
                ? CircleAvatar(
                    radius: 16,
                    child: Text(
                      '$iterator',
                      style: GoogleFonts.robotoCondensed(),
                    ),
                  )
                : null,
            title: Text(text),
          ),
          if (useIterator) const Divider(color: Colors.black38),
        ],
      ),
    );
  }
}
