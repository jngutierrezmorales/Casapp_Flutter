import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  static const loginPage = "loginPage";

  LoginRouting? loginRouting;

  LoginPage(this.loginRouting);

  @override
  State<LoginPage> createState() => _LoginPageState(loginRouting);
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  LoginRouting? loginRouting;

  _LoginPageState(this.loginRouting);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _usernameController.text = "";
    _passwordController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) _onLogged();
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Casapp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 75,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Image.asset(
                        'assets/imgs/login_logo.png',
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                        child: Form(
                          child: Column(
                            children: [
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
                                        minimumSize: const Size(150, 40),
                                        primary: Colors.black,
                                      ),
                                      onPressed: () =>
                                          (state is LoginInProgress)
                                              ? null
                                              : _postLogin(),
                                      child: const Text(
                                        "Acceder",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(150, 40),
                                        primary: Colors.black,
                                      ),
                                      onPressed: () =>
                                          (state is LoginInitialState)
                                              ? _toRegister()
                                              : null,
                                      child: const Text(
                                        "Crear usuario",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
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
      ),
    );
  }

  Column _buildTextFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Usuario:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextField(
          controller: _usernameController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Contraseña:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
        ),
      ],
    );
  }

  _postLogin() => BlocProvider.of<LoginBloc>(context).add(
        LoginAuthenticationEvent(
          context: context,
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );

  _toRegister() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginNavigateToRegisterEvent(context: context),
    );
  }

  _onLogged() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginNavigateToHomeEvent(context: context),
    );
  }
}
