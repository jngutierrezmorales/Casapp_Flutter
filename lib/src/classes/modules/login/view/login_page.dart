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

  late LoginBloc _loginBloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _usernameController.text = "test@test.com";
    _passwordController.text = "test123";
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
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'CASAPP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Image.asset(
                        'assets/imgs/casapp_logo.png',
                      ),
                      SizedBox(
                        height: height * 0.05,
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
                                        minimumSize: Size(100, 40),
                                      ),
                                      onPressed: () => (state is LoginInProgress)
                                          ? null
                                          : _postLogin(),
                                      child: const Text("Acceder"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 40),
                                      ),
                                      onPressed: () => (state is LoginInitialState)
                                          ? _toRegister()
                                          : null,
                                      child: const Text("Crear usuario"),
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
        const Text("Usuario:"),
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

  void _onLogged() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginNavigateToHomeEvent(context: context),
    );
  }
}
