import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_design/services/auth_service.dart';
import 'package:rapid_design/witgets/card.dart';

enum LoginOrRegister {
  login,
  register,
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  LoginOrRegister loginOrRegister = LoginOrRegister.login;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  List<Widget> buildWidgets() {
    if (loginOrRegister == LoginOrRegister.login) {
      return [
        RaisedButton(
          child: Text('Влез'),
          onPressed: () {
            context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
          },
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0.0,
          color: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              loginOrRegister = LoginOrRegister.register;
            });
          },
          child: Text('Нямате акаунт?'),
        ),
      ];
    } else {
      return [
        RaisedButton(
          onPressed: () {
            //showPopup(context, 'Privacy Policy');
            context.read<AuthenticationService>().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
          },
          child: Text('Направете нов акаунт'),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0.0,
          color: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              loginOrRegister = LoginOrRegister.login;
            });
          },
          child: Text('Влез със съществуващ акаунт'),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("House Center"),
      ),
      body: GestureDetector(
        onTap: () {
          primaryFocus.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://i.etsystatic.com/20162739/r/il/9d5e14/1912157632/il_570xN.1912157632_i98t.jpg',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWitget(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Имейл",
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Парола",
                          ),
                        ),
                        ...buildWidgets(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
