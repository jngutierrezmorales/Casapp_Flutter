import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routing/search_routing.dart';

class SearchPage extends StatefulWidget {
  static const searchPage = "searchPage";

  SearchRouting? searchRouting;

  SearchPage(this.searchRouting);

  @override
  State<SearchPage> createState() => _SearchPageState(searchRouting);
}

class _SearchPageState extends State<SearchPage> {
  SearchRouting? searchRouting;

  _SearchPageState(this.searchRouting);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}
