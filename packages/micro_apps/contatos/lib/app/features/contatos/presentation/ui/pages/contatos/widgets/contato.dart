// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../../../../controllers/contato_controller.dart';
import '../../../../../models/contato_model.dart';
import '../../../../../services/validators/formatar_datetime.dart';

class Contato extends StatefulWidget {
  ContatoModel contato;
  Color cor;
  ContatoController controller;
  Contato({
    Key? key,
    required this.controller,
    required this.contato,
    required this.cor,
  }) : super(key: key);

  @override
  State<Contato> createState() => _ContatoState(contato, cor, controller);
}

class _ContatoState extends State<Contato> {
  
  ContatoController controller;
  ContatoModel contato;
  Color cor;
  _ContatoState(this.contato, this.cor, this.controller);
  Future<bool> deletar(int idContato) async {
    var resultado = await controller.deletarContato(idContato);
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Container(
            decoration: BoxDecoration(
                color: cor, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                  selectedColor: Colors.transparent,
                  selectedTileColor: Colors.transparent,
                  enableFeedback: false,
                    title: Text(
                      contato.nome,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.face,
                      color: Theme.of(context).highlightColor,
                      size: 30,
                    ),
                    isThreeLine: false,
                    onTap: () {
                      setState(() {
                         pressed = !pressed;
                        if (pressed) {
                          cor = Theme.of(context).primaryColorLight;
                        } else {
                          cor = Theme.of(context).primaryColor;
                        }

                      });
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'nº documento:',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    contato.documento,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    var tentativa = await deletar(contato.id);
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
                                                backgroundColor: Theme.of(context)
                                                    .errorColor
                                                    .withOpacity(0.7),
                                                title: Text(
                                                  'Contato Deletado',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        navigatorKey.currentState
                                                            ?.pushReplacementNamed(
                                                                '/contatos');
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
                                        color: Theme.of(context).primaryColor),
                                  )),
                            ],
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
