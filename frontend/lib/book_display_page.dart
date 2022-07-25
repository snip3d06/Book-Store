import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'image_full.dart';

class BookDisplayPage extends StatelessWidget {
  const BookDisplayPage(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.description})
      : super(key: key);
  final String name;
  final String image;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {}),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                  //title: Text(name),
                  background: Hero(
                tag: 'Book $name',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pictures of $name',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    StreamBuilder(
                        stream: Dio()
                            .get(
                              'http://192.168.0.16:8000/api/images_for_book/$name',
                            )
                            .asStream(),
                        builder: (context, AsyncSnapshot<Response> snapshot) {
                          if (snapshot.hasData) {
                            List data = snapshot.data!.data;
                            return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      for (var image in data)
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Hero(
                                                tag: 'image ${image['id']}',
                                                child: GestureDetector(
                                                  onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ImageDisplayPage(
                                                                name: image[
                                                                    'name'],
                                                                image: image[
                                                                    'image'],
                                                                id: image['id'],
                                                              ))),
                                                  child: Container(
                                                      height: 150,
                                                      width: 250,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .background,
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (image[
                                                              'has_background']) {
                                                            return Image.network(
                                                                image['image'],
                                                                fit: BoxFit
                                                                    .cover);
                                                          }
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.network(
                                                                image['image'],
                                                                fit: BoxFit
                                                                    .contain),
                                                          );
                                                        },
                                                      )),
                                                ),
                                              ),
                                            ))
                                    ],
                                  ),
                                ));
                          }
                          return const SizedBox(
                            height: 150,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Description',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description),
                    )
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}
