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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Volver'),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<OptionsBloc, OptionsState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Form(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/imgs/settings_logo.png',
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            SwitchListTile(
                              title: const Text('Modo Oscuro'),
                              secondary: const Icon(Icons.dark_mode),
                              onChanged: (value) {
                                setState(() {
                                  _toogleDarkMode = value;
                                });
                              },
                              value: _toogleDarkMode,
                            ),
                            SizedBox(
                              height: height * 0.4,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 40),
                                      primary: Colors.black,
                                    ),
                                    onPressed: () =>
                                        (state is OptionsInitialState)
                                            ? _goToHome
                                            : null,
                                    child: const Text("Aceptar"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
