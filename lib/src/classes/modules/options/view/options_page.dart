import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/options_bloc.dart';
import '../bloc/options_event.dart';
import '../bloc/options_state.dart';

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
  bool _toogleDarkMode = false;

  @override
  void initState() {
    _optionsBloc = BlocProvider.of<OptionsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volver',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<OptionsBloc, OptionsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Image.asset(
                    'assets/imgs/options_logo.png',
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Modo Oscuro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    secondary: const Icon(Icons.dark_mode),
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _toogleDarkMode = value;
                        if (value == false) {
                          print("false");
                        } else {
                          print("true");
                        }
                      });
                    },
                    value: _toogleDarkMode,
                  ),
                  SizedBox(
                    height: height * 0.30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      MaterialApp(
                        theme: ThemeData(brightness: Brightness.dark),
                      );
                      dispose();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Aplicar cambios",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _goToHome() => BlocProvider.of<OptionsBloc>(context).add(
        OptionsNavigateToHomeEvent(context: context),
      );
}
