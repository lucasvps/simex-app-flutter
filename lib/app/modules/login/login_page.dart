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
          return Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.889,
            child: Stack(
              children: <Widget>[
                Image.asset('lib/assets/images/loginsimex.jpg'),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            topLeft: Radius.circular(80))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                          child: TextField(
                            onChanged: controller.loginStore.setEmail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                errorText: controller.validateEmail(),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 64),
                            child: Observer(builder: (_) {
                              return TextField(
                                obscureText: controller.loginStore.isObscure,
                                onChanged: controller.loginStore.setPassword,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: controller.loginStore.isObscure
                                        ? IconButton(
                                            icon: Icon(Icons.visibility_off),
                                            onPressed: controller
                                                .loginStore.changeObscure)
                                        : IconButton(
                                            icon: Icon(Icons.visibility),
                                            onPressed: controller
                                                .loginStore.changeObscure),
                                    labelText: "Senha",
                                    errorText: controller.validatePass(),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                              );
                            })),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: controller.isLoginValid()
                                  ? () {
                                      var userLogin = UserModel(
                                          email: controller.loginStore.email,
                                          password:
                                              controller.loginStore.password);

                                      controller.login(userLogin).then((value) {
                                        Modular.to
                                            .pushReplacementNamed('/home');
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
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
