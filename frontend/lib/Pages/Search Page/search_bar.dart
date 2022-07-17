import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filters.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Consumer<Filters>(
        builder: ((context, filters, child) => TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      textController.clear();
                    });
                    ;
                  },
                ),
              ),
              onChanged: filters.setText,
            )));
  }
}
