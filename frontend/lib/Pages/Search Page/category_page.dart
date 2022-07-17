import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(
      {Key? key, required this.id, required this.title, required this.image})
      : super(key: key);
  final int id;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: 'category_$id',
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explore $title',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 25),
                ),
              )),
          Expanded(
            child: Container(
              child: Text(title),
            ),
          )
        ],
      ),
    );
  }
}
