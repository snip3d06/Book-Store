import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text('Book Store'),
      centerTitle: true,
      actions: [],
    );
  }
}
