import 'category_card.dart';
import 'package:flutter/material.dart';

class CategoryCardList extends StatelessWidget {
  CategoryCardList({Key? key}) : super(key: key);
  Map<int, List<String>> categories = {
    0: ['All Genres', 'Assets/Category Images/all.jpg'],
    1: ['Science Fiction', 'Assets/Category Images/science_fiction.jpg'],
    2: ['Fantasy', 'Assets/Category Images/fantasy.jpg'],
    3: ['Mystery', 'Assets/Category Images/mystery.jpg'],
    4: ['Romance', 'Assets/Category Images/romance.jpg'],
    5: ['Horror', 'Assets/Category Images/horror.jpg'],
    6: ['Adventure', 'Assets/Category Images/adventure.jpg'],
    7: ['Action', 'Assets/Category Images/action.jpg'],
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < categories.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: CategoryCard(
              id: i,
              title: categories[i]![0],
              image: categories[i]![1],
            ),
          )
      ],
    );
  }
}
