import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/options_bloc.dart';

class OptionsPage extends StatefulWidget {
  static const optionsPage = "optionsPage";

  OptionsRouting? optionsRouting;

  OptionsPage(this.optionsRouting);

  @override
  State<OptionsPage> createState() => _OptionsPageState(optionsRouting);
}

class _OptionsPageState extends State<OptionsPage> {
  OptionsRouting? optionsRouting;

  _OptionsPageState(this.optionsRouting);

  late OptionsBloc _optionsBloc;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Options"),
      ),
    );
  }
}
