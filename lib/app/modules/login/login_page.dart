import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Realizar Login'),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: TextField(
                  onChanged: controller.loginStore.setEmail,
                  decoration: InputDecoration(
                      errorText: controller.validateEmail(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 64),
                child: TextField(
                  onChanged: controller.loginStore.setPassword,
                  decoration: InputDecoration(
                      errorText: controller.validatePass(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: controller.isLoginValid()
                        ? () {
                            var userLogin = UserModel(
                                email: controller.loginStore.email,
                                password: controller.loginStore.password);

                            controller.login(userLogin).then((value) {
                              Modular.to.pushReplacementNamed('/home');
                            }).catchError((err) {
                              print(err.toString());
                            });
                          }
                        : null,
                    child: Text('LOGIN'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
