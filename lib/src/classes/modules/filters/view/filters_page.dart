import 'package:casapp/src/classes/modules/filters/routing/filters_routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/filters_bloc.dart';

class FiltersPage extends StatefulWidget {
  static const filtersPage = "filtersPage";

  FiltersRouting? filtersRouting;

  FiltersPage(this.filtersRouting);

  @override
  State<FiltersPage> createState() => _FiltersPageState(filtersRouting);
}

class _FiltersPageState extends State<FiltersPage> {
  FiltersRouting? filtersRouting;

  _FiltersPageState(this.filtersRouting);

  late FiltersBloc _filtersBloc;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Filters"),
      ),
    );
  }
}
