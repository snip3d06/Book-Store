import 'package:flutter/material.dart';

class BookSmallDisplay extends StatelessWidget {
  const BookSmallDisplay(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);
  final String name;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 175,
        height: 300,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
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
    );
  }
}
