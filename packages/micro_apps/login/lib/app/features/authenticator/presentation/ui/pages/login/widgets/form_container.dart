import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_form.dart';

class FormContainer extends StatelessWidget {
  var valorUser;
  var formUser;
  var valorPass;
  var formPass;
  FormContainer({Key? key, required this.formUser, required this.valorUser, required this.formPass, required this.valorPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: InputForm(
            tipo: 'E-mail',
            icone: Icon(Icons.email),
            obscuro: false,
            valor: valorUser,
            form: formUser,
            maxlines: 1,
            keyboard: TextInputType.emailAddress,
            formato: FilteringTextInputFormatter.singleLineFormatter,
          ),
        ),
        Container(
          child: InputForm(
            tipo: 'Senha',
            icone: Icon(Icons.lock),
            obscuro: true,
            valor: valorPass,
            form: formPass,
            maxlines: 1,
            keyboard: TextInputType.name,
            formato: FilteringTextInputFormatter.singleLineFormatter,
          ),
        ),
      ],
    );
  }
}
