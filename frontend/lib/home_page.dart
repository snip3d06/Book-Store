import 'package:flutter/material.dart';
import 'package:frontend/app_bar.dart';
import 'package:frontend/reccomendation_content.dart';
import 'package:frontend/search_bar.dart';
import 'package:frontend/search_results.dart';
import 'package:provider/provider.dart';

import 'search_change_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar().build(context),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: ChangeNotifierProvider(
          create: (_) => SearchChangeNotifier(),
          child: Column(
            children: [
              SearchBar(),
              Expanded(
                child: Consumer<SearchChangeNotifier>(
                    builder: (context, notifier, child) {
                  if (notifier.searchText.isEmpty) {
                    return const ReccomendationContent();
                  }
                  return const Center(
                    child: SearchResults(),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
