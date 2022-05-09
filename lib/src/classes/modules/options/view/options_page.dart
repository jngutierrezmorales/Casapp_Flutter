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

  bool _toggleAirplaneMode = false;
  bool _toggleBluetooth = false;
  bool _toggleWiFi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opciones"),
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Modo Avión'),
              secondary: Icon(Icons.airplanemode_active),
              onChanged: (value) {
                setState(() {
                  _toggleAirplaneMode = value;
                });
              },
              value: _toggleAirplaneMode,
            ),
            Divider(
              thickness: 1.2,
            ),
            SwitchListTile(
              title: Text('Wi-Fi'),
              secondary: Icon(Icons.wifi),
              onChanged: (value) {
                setState(() {
                  _toggleWiFi = value;
                });
              },
              value: _toggleWiFi,
            ),
            Divider(
              thickness: 1.2,
            ),
            SwitchListTile(
              title: Text('Bluetooth'),
              secondary: Icon(Icons.bluetooth),
              onChanged: (value) {
                setState(() {
                  _toggleBluetooth = value;
                });
              },
              value: _toggleBluetooth,
            ),
          ],
        ),
      ),
    );
  }
}
