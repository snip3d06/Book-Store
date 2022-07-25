import 'package:flutter/material.dart';

class ImageDisplayPage extends StatelessWidget {
  const ImageDisplayPage(
      {Key? key, required this.id, required this.name, required this.image})
      : super(key: key);
  final int id;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(name, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Hero(
          tag: 'image $id',
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
