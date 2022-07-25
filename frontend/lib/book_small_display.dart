import 'package:flutter/material.dart';
import 'book_display_page.dart';

class BookSmallDisplay extends StatelessWidget {
  const BookSmallDisplay({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  }) : super(key: key);
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookDisplayPage(
              name: name,
              image: image,
              price: price,
              description: description,
            ),
          ),
        ),
        child: Container(
          width: 175,
          height: 300,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: 'Book $name',
                child: Container(
                  height: 200,
                  child: Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '£${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
