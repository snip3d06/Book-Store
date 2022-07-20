import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'filters.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Dio().post('http://127.0.0.1:8000/').asStream(),
        builder: (context, snapshot) {
          print(snapshot.error);
          return Container(
            child: Text("${snapshot.data}"),
          );
        });
  }
}
