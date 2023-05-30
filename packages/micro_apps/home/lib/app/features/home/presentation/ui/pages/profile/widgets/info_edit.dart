// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/app/features/home/presentation/ui/pages/profile/widgets/input_form.dart';

class InfoEdit extends StatelessWidget {
  var valorUser;
  var formUser;
  var valorTelefone;
  var formTelefone;
  var valorAp;
  var formAp;
  Map userInfo;

  InfoEdit(
      {Key? key,
      required this.valorUser,
      required this.formUser,
      required this.valorTelefone,
      required this.formTelefone,
      required this.valorAp,
      required this.formAp,
      required this.userInfo})
      : super(key: key);

  
  
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          child: Column(
        children: [
          InputForm(
            valorInicial: userInfo['email'],
            tipo: 'E-mail',
            icone: Icon(Icons.mail),
            obscuro: false,
            valor: valorUser,
            form: formUser,
            maxlines: 1,
            keyboard: TextInputType.name,
            formato: FilteringTextInputFormatter.singleLineFormatter,
          ),
          InputForm(
              valorInicial: userInfo['telefone'],
              tipo: 'Telefone',
              icone: Icon(Icons.phone),
              obscuro: false,
              valor: valorTelefone,
              form: formTelefone,
              maxlines: 1,
              keyboard: TextInputType.number,
              formato: FilteringTextInputFormatter.digitsOnly),
          InputForm(
            valorInicial: userInfo['ap'],
            tipo: 'Apartamento',
            icone: Icon(Icons.person_pin_circle),
            obscuro: false,
            valor: valorAp,
            form: formAp,
            maxlines: 1,
            keyboard: TextInputType.name,
            formato: FilteringTextInputFormatter.singleLineFormatter,
          ),
        ],
      )),
    );
  }
}
