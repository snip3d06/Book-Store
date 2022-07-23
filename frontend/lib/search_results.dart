import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/book_small_display.dart';
import 'package:provider/provider.dart';
import 'search_change_notifier.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Dio().post('http://192.168.0.16:8000/api/search/', data: {
        "search":
            Provider.of<SearchChangeNotifier>(context, listen: true).searchText,
      }).asStream(),
      builder: (context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 8,
                children: [
                  for (Map book in snapshot.data!.data)
                    BookSmallDisplay(
                        name: book['name'],
                        price: book['price'],
                        image: book['image']),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
