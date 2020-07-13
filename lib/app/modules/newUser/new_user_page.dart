import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/modules/newClient/widgets/custom_text_field.dart';
import 'new_user_controller.dart';

class NewUserPage extends StatefulWidget {
  final String title;
  const NewUserPage({Key key, this.title = "NewUser"}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends ModularState<NewUserPage, NewUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Vendedor'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return Column(
          children: <Widget>[
            CustomTextField(
              label: "Nome",
              error: controller.store.validateName,
              onChangedFunction: controller.store.setUserName,
            ),
            CustomTextField(
              label: "Email",
              error: controller.store.validateEmail,
              onChangedFunction: controller.store.setUserEmail,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                obscureText: !controller.store.isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: controller.store.isPasswordVisible
                      ? IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            controller.store.changeVisibility();
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.visibility_off),
                          onPressed: () {
                            controller.store.changeVisibility();
                          },
                        ),
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  errorText: controller.store.validatePassword(),
                ),
                onChanged: controller.store.setUserPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: controller.store.isAdmin,
                      onChanged: (value) => controller.store.setIsAdmin()),
                  Text(
                    'Salvar como administrador',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: controller.store.isButtonValid
                  ? () {
                      controller.store.registerUser();
                    }
                  : null,
              child: Text(
                'REGISTRAR',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: AppThemeLight().getTheme().primaryColor,
            )
          ],
        );
      }),
    );
  }
}
