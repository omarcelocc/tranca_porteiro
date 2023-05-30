// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:convite/app/features/convites/controllers/convite_controller.dart';
import 'package:convite/app/features/convites/models/convite_model.dart';
import 'package:convite/app/features/convites/services/requests/convite_service.dart';
import 'package:dependencies/app/base_api/services/clients/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../../../../services/validators/formatar_datetime.dart';

class Convite extends StatefulWidget {
  ConviteModel convite;
  Color cor;
  Convite({
    Key? key,
    required this.convite,
    required this.cor,
  }) : super(key: key);

  @override
  State<Convite> createState() => _ConviteState(convite, cor);
}

class _ConviteState extends State<Convite> {
  ConviteModel convite;
  Color cor;
  _ConviteState(this.convite, this.cor);
  Future<bool> deletar(int idConvite) async {
    var resultado = await ConviteController(ConviteService(DioClient()))
        .deletarConvite(idConvite);
    return resultado;
  }

  bool pressed = false;
  bool deletou = false;

  @override
  Widget build(BuildContext context) {
    Widget Texto(String texto) {
      return Text(
        texto,
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }

    return Visibility(
      visible: !deletou,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
            decoration: BoxDecoration(
                color: cor, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                    title: Text(
                      convite.nome,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Texto(convite.dataEntrada),
                    leading: Icon(
                      convite.tipo == 'CONVIDADO'
                          ? Icons.face
                          : Icons.home_repair_service,
                      color: Theme.of(context).highlightColor,
                      size: 30,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Texto(FormatarDateTime().formatarHoras(
                            convite.horaInicio, convite.horaFim)),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    onLongPress: () async {
                      var tentativa = await deletar(convite.id);
                      if (tentativa) {
                        setState(() {
                          deletou = true;
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: AlertDialog(
                                  icon: Icon(Icons.check),
                                  iconColor: Theme.of(context).highlightColor,
                                  backgroundColor: Theme.of(context)
                                      .errorColor
                                      .withOpacity(0.7),
                                  title: Text(
                                    'Convite Deletado',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          navigatorKey.currentState
                                              ?.pushReplacementNamed(
                                                  '/convite');
                                        },
                                        child: Text(
                                          'Ok',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            });
                      } else {}
                    }),
                Visibility(
                    visible: pressed,
                    child: Container(
                      decoration: BoxDecoration(
                          color: cor, borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('nº documento:',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  ),
                                  Text(convite.documento,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w600
                                  ),)
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Tipo:', style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),), 
                                Text(convite.tipo, 
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w600
                                  ),)
                                ],
                              ),
                            ],
                          ),
                          Visibility(
                            visible: convite.status == 'ATIVO',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      var tentativa = await deletar(convite.id);
                                      if (tentativa) {
                                         setState(() {
                                          deletou = true;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child: AlertDialog(
                                                  icon: Icon(Icons.check),
                                                  iconColor: Theme.of(context)
                                                      .highlightColor,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .errorColor
                                                          .withOpacity(0.7),
                                                  title: Text(
                                                    'Convite Deletado',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          navigatorKey
                                                              .currentState
                                                              ?.pushReplacementNamed(
                                                                  '/convite');
                                                        },
                                                        child: Text(
                                                          'Ok',
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .highlightColor,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              );
                                            });
                                      } else {}
                                    },
                                    child: Text(
                                      'Apagar',
                                      style: TextStyle(
                                          color: Theme.of(context).errorColor),
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Editar',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
