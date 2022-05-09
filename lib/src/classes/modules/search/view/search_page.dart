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
    return Scaffold(
      appBar: AppBar(
        title: Text('Volver'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Center(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      ),
                      hintText: 'Search...',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/imgs/search_logo.png'),
            height: 250,
          ),
        ],
      ),
    );
  }
}
