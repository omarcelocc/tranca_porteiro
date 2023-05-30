// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:convite/app/features/convites/controllers/convite_controller.dart';
import 'package:convite/app/features/convites/models/convite_model.dart';
import 'package:convite/app/features/convites/models/ids_model.dart';
import 'package:convite/app/features/convites/presentation/ui/pages/navigator/navigator_screen.dart';
import 'package:convite/app/features/convites/services/requests/convite_service.dart';
import 'package:dependencies/app/base_api/services/clients/dio_client.dart';
import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../controllers/contato_controller.dart';
import '../../../../../models/contato_model.dart';
import '../../../../../services/requests/contatos_services.dart';

class RegisterButton extends StatefulWidget {
  List<ContatoModel> allContatosUser;
  var valorContato;
  var formContato;
  var valorName;
  var formName;
  var valorDoc;
  var formDoc;
  var valorTipo;
  var valorData;
  var valorHorarioInicio;
  var valorHorarioFim;
  var valorSalvar;

  RegisterButton({
    Key? key,
    required this.valorSalvar,
    required this.allContatosUser,
    required this.valorContato,
    required this.formContato,
    required this.valorName,
    required this.formName,
    required this.valorDoc,
    required this.formDoc,
    required this.valorTipo,
    required this.valorData,
    required this.valorHorarioInicio,
    required this.valorHorarioFim,
  }) : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  var controllerConvite = ConviteController(ConviteService(DioClient()));
  var contatoController = ContatoController(ContatoService(DioClient()));
  Future<dynamic> criarConvite(ConviteModel convite) async {
    var result = await controllerConvite.criarConvite(convite);
    return result;
  }

  Future<bool> salvarContato(ContatoModel contato) async {
    var result = await contatoController.criarContato(contato);
    return result;
  }

  bool tapped = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();

        if (widget.formName.currentState!.validate() &&
            widget.formDoc.currentState!.validate()) {
          if (tapped) {
            setState(() {
              tapped = !tapped;
            });
          }
          if (widget.valorTipo.text == '') {
            widget.valorTipo.text = 'CONVIDADO';
          }
          /*
          IDsLocal iDsLocal = IDsLocal();
          await iDsLocal.startBanco();
          IDsModel ids = IDsModel.fromList(iDsLocal.sp.getStringList('ids')!);
          String idUser = ids.idUser.toString();
          String idCondo = ids.idCondo.toString();
*/
          ConviteModel convite = ConviteModel(
              //idCondo: int.parse(idCondo),
              documento: widget.valorDoc.text,
              dataEntrada: widget.valorData.text,
              horaInicio: widget.valorHorarioInicio.text,
              horaFim: widget.valorHorarioFim.text,
              nome: widget.valorName.text,
              tipo: widget.valorTipo.text,
              //idUser: int.parse(idUser),
              status: 'ATIVO');
          await criarConvite(convite);
          var saida = true;
          print('saida: $saida');

          setState(() {
            tapped = !tapped;
          });
          
          if (saida == true) {
            bool contatoExist = false;
            bool salvar = false;
            bool salvou = false;
            if (widget.valorSalvar.text == 'salvar') {
              salvar = true;
              ContatoModel contato = ContatoModel(
                  id: 0,
                  idUser: int.parse('0'),
                  documento: widget.valorDoc.text,
                  nome: widget.valorName.text);
              for (var contatoUser in widget.allContatosUser) {
                if (contato.nome == contatoUser.nome) {
                  contatoExist = true;
                  break;
                }
              }
              if (contatoExist == false) {
                bool requestContato = await salvarContato(contato);
                salvou = requestContato;
              }
            }

            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      icon: const Icon(Icons.check),
                      iconColor: Theme.of(context).highlightColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      title: const Text(
                        'Convite Criado',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Visibility(
                          visible: salvar,
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: contatoExist
                                  ? const Text(
                                      'Já existe um contato com esse nome!',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      salvou
                                          ? 'Contato Salvo!'
                                          : 'Houve um problema ao salvar o contato!',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          )),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Criar outro',
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              navigatorKey.currentState
                                  ?.pushReplacementNamed('/convite');
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
          } else if (saida == false) {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      title: const Text('Erro interno'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigatorScreen(
                                          index: 2,
                                        )),
                              );
                            },
                            child: const Text('Tentar Novamente')),
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
                      title: const Text('Erro de Conexão'),
                      content: const Text(
                          'Parece que você não tem internet, verifique sua conexão e tente novamente!'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigatorScreen(
                                          index: 2,
                                        )),
                              );
                            },
                            child: const Text('Ok')),
                      ],
                    ),
                  );
                });
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Data Inválida!',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Theme.of(context).errorColor,
            padding: EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
          ));
        }
      },
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
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
              image: const DecorationImage(
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
                          'Criar Convite',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      : CircularProgressIndicator(
                          color: Theme.of(context).highlightColor,
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
