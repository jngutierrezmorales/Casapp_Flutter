import 'package:casapp/src/classes/modules/register/bloc/register_bloc.dart';
import 'package:casapp/src/classes/modules/register/bloc/register_event.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_state.dart';

class RegisterPage extends StatefulWidget {
  static const registerPage = "registerPage";

  RegisterRouting? registerRouting;

  RegisterPage(this.registerRouting);

  @override
  State<RegisterPage> createState() => _RegisterPageState(registerRouting);
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterRouting? registerRouting;

  _RegisterPageState(this.registerRouting);

  late RegisterBloc _registerBloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _usernameController.text = "";
    _passwordController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Form(
                        child: Column(
                          children: [
                            const Text(
                              'Crea una nueva cuenta',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Image.asset(
                              'assets/imgs/registro_logo.png',
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            _buildTextFields(),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 40),
                                    ),
                                    onPressed: () =>
                                        (state is RegisterInProgress)
                                            ? null
                                            : _postRegister(),
                                    child: const Text("Confirmar"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 40),
                                    ),
                                    onPressed: () =>
                                        (state is RegisterInitialState)
                                            ? _cancelToLogin()
                                            : null,
                                    child: const Text("Cancelar"),
                                  ),
                                ],
                              ),
                            )
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

  Column _buildTextFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email:"),
        TextField(
          controller: _usernameController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Contraseña:"),
        TextField(
          controller: _passwordController,
          obscureText: true,
        ),
      ],
    );
  }

  _postRegister() => BlocProvider.of<RegisterBloc>(context).add(
        RegisterAuthenticationEvent(
            context: context,
            username: _usernameController.text,
            password: _passwordController.text),
      );

  _cancelToLogin() => BlocProvider.of<RegisterBloc>(context).add(
        RegisterNavigateToLoginEvent(context: context),
      );
}
