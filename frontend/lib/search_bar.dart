import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_change_notifier.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: TextField(
        onChanged:
            Provider.of<SearchChangeNotifier>(context, listen: true).search,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
        ),
      ),
    );
  }
}
