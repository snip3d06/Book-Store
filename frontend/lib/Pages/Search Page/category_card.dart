import 'package:flutter/material.dart';
import 'category_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.id, required this.title, required this.image})
      : super(key: key);
  final int id;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Hero(
          tag: 'category_$id',
          child: GestureDetector(
            onTap: (() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CategoryPage(id: id, title: title, image: image)));
            }),
            child: Container(
              height: 120,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
  }
}
