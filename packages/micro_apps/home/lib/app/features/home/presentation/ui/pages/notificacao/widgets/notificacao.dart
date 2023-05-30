// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class Notificacao extends StatelessWidget {
  String nome;
  String tipo;
  Color cor;
  Notificacao({
    Key? key,
    required this.nome,
    required this.tipo,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String texto = 'Seu ${tipo.toLowerCase()} $nome chegou!';
    Widget Texto(String texto) {
      return Text(
        texto,
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }

    return Card(
      elevation: 0,
      child: ListTile(
        onTap: (){
          navigatorKey.currentState?.pushReplacementNamed('/conviteFinalizado');
        },
       leading: Text(
           texto,
           style: TextStyle(
             color: cor, fontWeight: FontWeight.w500,
             fontSize: 14
           ),
         ),
        
        isThreeLine: false,
        trailing:  Icon(
            Icons.notifications,
            color: Theme.of(context).primaryColorLight,
          ),
      ),
    );
  }
}
