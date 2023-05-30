// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';
import 'package:dependencies/app/base_local_storage/services/banco_local.dart';
import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:login/app/features/authenticator/models/login_model.dart';
import 'package:login/app/features/authenticator/services/auth/login_service.dart';
import 'package:micro_core/micro_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../controllers/login_controller.dart';
import '../../../../../services/clients/dio_client.dart';

class LoginButton extends StatefulWidget {
  GlobalKey<FormState> formUser;
  var valorUser;
  GlobalKey<FormState> formPass;
  var valorPass;

  LoginButton(
      {Key? key,
      required this.formUser,
      required this.valorUser,
      required this.formPass,
      required this.valorPass})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future<bool> logar(LoginModel data) async {
    try {
      await LoginController(LoginService(DioClient())).fazerLogin(data);
      return true;
    } catch (exp) {
      print(exp);
      return false;
    }
  }

  Future<bool> logar2(LoginModel data) async {
   // sleep(Duration(seconds: 2));

    if (data.email == 'marcelo@gmail.com' && data.senha == 'abc123') {
          SharedPreferences sp = await SharedPreferences.getInstance();

        await sp.setString('token', 'asdfghjkl');

      return true;
    } else {
      return false;
    }
  }

  bool tapped = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       // navigatorKey.currentState?.pushReplacementNamed('/home');

        if (widget.formUser.currentState!.validate() &&
            widget.formPass.currentState!.validate()) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (tapped) {
            setState(() {
              tapped = !tapped;
            });
          }
          LoginModel data = LoginModel(
              email: widget.valorUser.text, senha: widget.valorPass.text);
          bool logando = await logar2(data);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          if (logando) {
            Timer(Duration(milliseconds: 1500), () {
              navigatorKey.currentState?.pushReplacementNamed('/home');
              setState(() {
                tapped = !tapped;
              });
            });
          } else {
            Timer(Duration(milliseconds: 1000), () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Email ou senha incorretos!',
                  style: TextStyle(fontSize: 18),
                ),
                backgroundColor: Colors.deepOrange,
                padding:
                    EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
              ));
              setState(() {
                tapped = !tapped;
              });
            });
          }
        }
      },
      child: Container(
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 50,
            width: tapped ? 150 : 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.95),
                    Theme.of(context).primaryColorLight
                  ],
                  begin: const FractionalOffset(0, 0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: SizedBox(
                height: 100,
                width: 230,
                child: Center(
                    child: tapped
                        ? Text(
                            'ENTRAR',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Theme.of(context)
                                        .primaryColorDark
                                        .withOpacity(0.6),
                                    blurRadius: 20,
                                    offset: Offset(2, 5),
                                  )
                                ],
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        : CircularProgressIndicator(
                            color: Theme.of(context).focusColor,
                          )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
