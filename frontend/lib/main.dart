import 'package:flutter/material.dart';
import 'theme.dart';
import 'Pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: appTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text('Book Store'),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Home', icon: Icon(Icons.home)),
                  Tab(
                    text: 'Search',
                    icon: Icon(Icons.search),
                  ),
                  Tab(
                    text: 'Cart',
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ),
            body: const TabBarView(children: [
              Text('Page 1'),
              SearchPage(),
              Text('Page 3'),
            ])),
      ));
}
