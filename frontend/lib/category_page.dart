import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'author_avatar.dart';
import 'book_small_display.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(name),
                background: Hero(
                  tag: 'Category $name',
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )),
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Trending $name Books',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  StreamBuilder(
                      stream: Dio()
                          .get(
                            'http://192.168.0.16:8000/api/trending_books_by_category/$name',
                          )
                          .asStream(),
                      builder: (context, AsyncSnapshot<Response> snapshot) {
                        if (snapshot.hasData) {
                          List data = snapshot.data!.data;
                          data.shuffle();
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    for (var book in data)
                                      BookSmallDisplay(
                                        id: book['id'],
                                        name: book['name'],
                                        price: book['price'],
                                        image: book['main_image'],
                                        description: book['description'],
                                      ),
                                  ],
                                ),
                              ));
                        }
                        return const SizedBox(
                          height: 150,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Classic $name Books',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  StreamBuilder(
                      stream: Dio()
                          .get(
                            'http://192.168.0.16:8000/api/classic_books_by_category/$name',
                          )
                          .asStream(),
                      builder: (context, AsyncSnapshot<Response> snapshot) {
                        if (snapshot.hasData) {
                          List data = snapshot.data!.data;
                          data.shuffle();
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    for (var book in data)
                                      BookSmallDisplay(
                                        id: book['id'],
                                        name: book['name'],
                                        price: book['price'],
                                        image: book['main_image'],
                                        description: book['description'],
                                      ),
                                  ],
                                ),
                              ));
                        }
                        return const SizedBox(
                          height: 150,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('$name Authors',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  StreamBuilder(
                      stream: Dio()
                          .get(
                            'http://192.168.0.16:8000/api/authors_by_category/$name',
                          )
                          .asStream(),
                      builder: (context, AsyncSnapshot<Response> snapshot) {
                        if (snapshot.hasData) {
                          List data = snapshot.data!.data;
                          data.shuffle();
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    for (var author in data)
                                      AuthorAvatar(
                                          name: author['name'],
                                          image: author['image']),
                                  ],
                                ),
                              ));
                        }
                        return const SizedBox(
                          height: 96,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
