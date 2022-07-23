import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/category_card.dart';

import 'book_small_display.dart';

class ReccomendationContent extends StatelessWidget {
  const ReccomendationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Explore Genres',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          StreamBuilder(
              stream: Dio()
                  .get('http://192.168.0.16:8000/api/all_categories/')
                  .asStream(),
              builder: (context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var category in snapshot.data!.data)
                          CategoryCard(
                              name: category['name'], image: category['image']),
                      ],
                    ),
                  );
                }
                return Container(
                  height: 150,
                );
              }),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Explore Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          StreamBuilder(
              stream: Dio()
                  .get('http://192.168.0.16:8000/api/trending_books/')
                  .asStream(),
              builder: (context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  List data = snapshot.data!.data;
                  data.shuffle();
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            for (var book in data.sublist(0, 5))
                              BookSmallDisplay(
                                  name: book['name'],
                                  price: book['price'],
                                  image: book['image']),
                          ],
                        ),
                      ));
                }
                return Container(
                  height: 150,
                );
              }),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Explore the Classics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          StreamBuilder(
              stream: Dio()
                  .get('http://192.168.0.16:8000/api/classic_books/')
                  .asStream(),
              builder: (context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  List data = snapshot.data!.data;
                  data.shuffle();
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            for (var book in data.sublist(0, 5))
                              BookSmallDisplay(
                                  name: book['name'],
                                  price: book['price'],
                                  image: book['image']),
                          ],
                        ),
                      ));
                }
                return Container(
                  height: 150,
                );
              }),
        ],
      ),
    );
  }
}
