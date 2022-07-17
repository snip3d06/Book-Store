import 'package:flutter/material.dart';
import 'package:frontend/Pages/Search%20Page/category_card_list.dart';
import 'package:provider/provider.dart';
import 'filters.dart';
import 'search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Filters(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBar(),
          ),
          Expanded(
            child: Consumer<Filters>(
              builder: (context, filters, child) {
                if (filters.text.isEmpty) {
                  return CategoryCardList();
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
