import 'package:flutter/material.dart';

class AuthorAvatar extends StatelessWidget {
  const AuthorAvatar({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
