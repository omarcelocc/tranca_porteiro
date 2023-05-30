// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login/app/features/authenticator/controllers/cadastro_controller.dart';
import 'package:login/app/features/authenticator/models/cadastro_model.dart';
import 'package:login/app/features/authenticator/services/auth/cadastro_service.dart';
import 'package:login/app/features/authenticator/services/clients/dio_client.dart';
import 'package:micro_core/micro_core.dart';

class RegisterButton extends StatefulWidget {
  var valorCondo;
  var formCondo;
  var valorName;
  var formName;
  var valorLastname;
  var formLastname;
  var valorCpf;
  var formCpf;
  var valorUser;
  var formUser;
  var valorPass;
  var formPass;
  var valorData;
  var valorUnidade;
  var formUnidade;
  RegisterButton(
      {Key? key,
      required this.valorCondo,
      required this.formCondo,
      required this.valorUnidade,
      required this.formUnidade,
      required this.valorName,
      required this.formName,
      required this.valorLastname,
      required this.formLastname,
      required this.valorCpf,
      required this.formCpf,
      required this.formUser,
      required this.valorUser,
      required this.formPass,
      required this.valorPass,
      required this.valorData})
      : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

Future<bool> cadastrar(CadastroModel data) async {
  try {
    bool cadastro = await CadastroController(CadastroService(DioClient()))
        .fazerCadastro(data);
    return cadastro;
  } catch (exp) {
    print(exp);
    return false;
  }
}

Future<bool> cadastrar2(CadastroModel data) async {
  //sleep(Duration(seconds: 2));
  return true;
}

class _RegisterButtonState extends State<RegisterButton> {
  bool tapped = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
    
        if (widget.valorCondo.text == '') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Escolha um condominio!',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.deepOrange,
            padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
          ));
        } else if (widget.formName.currentState!.validate() &&
            widget.formLastname.currentState!.validate() &&
            widget.formCpf.currentState!.validate() &&
            widget.formUser.currentState!.validate() &&
            widget.formPass.currentState!.validate() &&
            widget.formUnidade.currentState!.validate()) {
          if (tapped) {
            setState(() {
              tapped = !tapped;
            });
          }
          CadastroModel dados = CadastroModel(
              telefone: '98996079869',
              idCondo: int.parse(widget.valorCondo.text),
              senha: widget.valorPass.text,
              sobrenome: widget.valorLastname.text,
              status: 'PENDENTE',
              nome: widget.valorName.text,
              data: widget.valorData.text,
              tipo: 'MORADOR',
              documento: widget.valorCpf.text,
              email: widget.valorUser.text,
              unidade: widget.valorUnidade.text);
          bool check = await cadastrar2(dados);

          if (check) {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      icon: Icon(Icons.check),
                      iconColor: Theme.of(context).highlightColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      title: const Text(
                        'Cadastro realizado com sucesso',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              navigatorKey.currentState
                                  ?.pushReplacementNamed('/login');
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                color: Theme.of(context).highlightColor,
                              ),
                            )),
                      ],
                    ),
                  );
                });
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      backgroundColor: Theme.of(context).errorColor,
                      title: const Text('Erro ao cadastrar'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              navigatorKey.currentState
                                  ?.pushReplacementNamed('/login');
                            },
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                color: Theme.of(context).highlightColor,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Tentar Novamente')),
                      ],
                    ),
                  );
                });
          }
          setState(() {
            tapped = !tapped;
          });
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
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight
                    ],
                    begin: const FractionalOffset(0, 0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('images/black.png'),
                  opacity: 0.05,
                  fit: BoxFit.cover,
                )),
            child: Center(
              child: Container(
                height: 100,
                width: 230,
                child: Center(
                    child: tapped
                        ? Text(
                            'CADASTRAR',
                            style: TextStyle(
                                color: HexColor('#ebe19a'),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        : CircularProgressIndicator(
                            color: HexColor('#ebe19a'),
                          )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
