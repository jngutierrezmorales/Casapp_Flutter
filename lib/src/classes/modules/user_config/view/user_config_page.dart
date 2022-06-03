import 'package:casapp/src/classes/modules/user_config/routing/user_config_routing.dart';
import 'package:flutter/material.dart';
import '../bloc/user_config_bloc.dart';

class UserConfigPage extends StatefulWidget {
  static const userConfigPage = "userConfigPage";

  UserConfigRouting? userConfigRouting;

  UserConfigPage(this.userConfigRouting);

  @override
  State<UserConfigPage> createState() =>
      _UserConfigPageState(userConfigRouting);
}

class _UserConfigPageState extends State<UserConfigPage> {
  final TextEditingController? _phone = TextEditingController();
  UserConfigRouting? userConfigRouting;
  late UserConfigBloc _userConfigBloc;

  _UserConfigPageState(this.userConfigRouting);

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                'Panel de Usuario',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Modifica tus opciones de usuario",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Introduce nueva contraseña:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Contraseña',
                      ),
                      controller: _phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Modificar contraseña',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Introduce tu número de teléfono:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Teléfono',
                      ),
                      controller: _phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Modificar teléfono',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      'assets/imgs/user_config_logo.png',
                      height: 180,
                      width: 180,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
