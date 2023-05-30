import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home/app/features/home/controllers/user_controller.dart';
import 'package:home/app/features/home/presentation/ui/pages/profile/widgets/button_edit.dart';
import 'package:home/app/features/home/presentation/ui/pages/profile/widgets/header_widget.dart';
import 'package:home/app/features/home/presentation/ui/pages/profile/widgets/profile_infor.dart';
import 'package:home/app/features/home/services/clients/dio_client.dart';
import 'package:home/app/features/home/presentation/ui/widgets/logout_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/user_model.dart';
import '../../../../services/requests/get_user_service.dart';
import 'widgets/info_edit.dart';

class ProfilePage extends StatefulWidget {
  UserModel usuario;
  ProfilePage({required this.usuario, super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState(usuario);
  }
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel usuario;
  _ProfilePageState(this.usuario);
  final _formUser = GlobalKey<FormState>();
  final _valorUser = TextEditingController();

  final _formTelefone = GlobalKey<FormState>();
  final _valorTelefone = TextEditingController();

  final _formAp = GlobalKey<FormState>();
  final _valorAp = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  bool tapped = true;
  bool tappedSalvar = true;
  @override
  Widget build(BuildContext context) {
      Map userInfo = {
        'firstName': usuario.nome,
        'lastName': usuario.sobrenome,
        'tipo': usuario.tipo,
        'ap': usuario.unidade,
        'email': usuario.email,
        'telefone': 'inserir',
        'data': usuario.data,
        'cpf': usuario.cpf
      };
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const SizedBox(
                height: 100,
                child: HeaderWidget(100, false),
              ),
              Container(
                        alignment: Alignment.center,
                        //margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                        child: Column(
                          children: [
                            Container(
                              
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                              
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20,
                                    offset: Offset(20, 20),
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.network('https://images.vexels.com/media/users/3/147102/isolated/preview/082213cb0f9eabb7e6715f59ef7d322a-cone-do-perfil-do-instagram.png',
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              userInfo['firstName'],
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              userInfo['tipo'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                           const  SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding:const EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 4.0),
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Center(
                                          child: Text(
                                            "Informações do Usuário",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            if (tapped) {
                                              setState(() {
                                                tapped = !tapped;
                                              });
                                            } else {
                                              setState(() {
                                                tapped = !tapped;
                                              });
                                            }
                                          },
                                          child: Center(
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 400),
                                              height: 40,
                                              width: tapped ? 40 : 80,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: tapped
                                                          ? [
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              Theme.of(context)
                                                                  .primaryColorLight
                                                            ]
                                                          : [
                                                              Theme.of(context)
                                                                  .errorColor,
                                                              Theme.of(context)
                                                                  .errorColor
                                                                  .withOpacity(
                                                                      0.5)
                                                            ],
                                                      begin:
                                                          const FractionalOffset(
                                                              0, 0),
                                                      end:
                                                          const FractionalOffset(
                                                              1.0, 0.0),
                                                      stops: const [0.0, 1.0],
                                                      tileMode: TileMode.clamp),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/black.png'),
                                                    opacity: 0.05,
                                                    fit: BoxFit.cover,
                                                  )),
                                              child: Center(
                                                child: Container(
                                                  height: 100,
                                                  width: 230,
                                                  child: Center(
                                                      child: tapped
                                                          ? Icon(
                                                              Icons.edit,
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor,
                                                            )
                                                          : Text(
                                                              'Cancelar',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Theme.of(
                                                                        context)
                                                                    .errorColor
                                                                    .withRed(
                                                                        255)
                                                                    .withGreen(
                                                                        165)
                                                                    .withBlue(
                                                                        165),
                                                              ),
                                                            )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      child: Center(
                                        child: tapped
                                            ? ProfileInfor(
                                                userInfo: userInfo,
                                              )
                                            : InfoEdit(
                                                valorUser: _valorUser,
                                                formUser: _formUser,
                                                valorTelefone: _valorTelefone,
                                                formTelefone: _formTelefone,
                                                valorAp: _valorAp,
                                                formAp: _formAp,
                                                userInfo: userInfo),
                                      )),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    padding: EdgeInsets.only(top: 30),
                                    child: Visibility(
                                      visible: !tapped,
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (_formUser.currentState!
                                                  .validate() &&
                                              _formTelefone.currentState!
                                                  .validate() &&
                                              _formAp.currentState!
                                                  .validate()) {
                                            if (tappedSalvar) {
                                              setState(() {
                                                tappedSalvar = !tappedSalvar;
                                              });
                                              Timer(Duration(milliseconds: 800),
                                                  () {
                                                setState(() {
                                                  userInfo['email'] =
                                                      _valorUser.text == ''
                                                          ? userInfo['email']
                                                          : _valorUser.text;
                                                  userInfo['telefone'] =
                                                      _valorTelefone.text == ''
                                                          ? userInfo['telefone']
                                                          : _valorTelefone.text;
                                                  userInfo['ap'] =
                                                      _valorAp.text == ''
                                                          ? userInfo['ap']
                                                          : _valorAp.text;
                                                  tapped = !tapped;
                                                  tappedSalvar = !tappedSalvar;
                                                });
                                              });
                                            }
                                          }
                                        },
                                        child: Center(
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            height: 40,
                                            width: tappedSalvar ? 100 : 40,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      Theme.of(context)
                                                          .primaryColorLight
                                                    ],
                                                    begin:
                                                        const FractionalOffset(
                                                            0, 0),
                                                    end: const FractionalOffset(
                                                        1.0, 0.0),
                                                    stops: const [0.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/black.png'),
                                                  opacity: 0.05,
                                                  fit: BoxFit.cover,
                                                )),
                                            child: Center(
                                              child: Center(
                                                  child: tappedSalvar
                                                      ? Text(
                                                          'Salvar',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .focusColor,
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Theme.of(
                                                                    context)
                                                                .focusColor,
                                                          ),
                                                        )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: tapped, child: LogOutButton())
                                ],
                              ),
                            )
                          ],
                        ),
                      )
            ],
          ),
        ),
      ),
    );
  }
}
