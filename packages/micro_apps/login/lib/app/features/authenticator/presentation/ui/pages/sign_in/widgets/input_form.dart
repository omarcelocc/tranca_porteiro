import 'package:flutter/material.dart';

import '../../../../../services/validators/validator.dart';

class InputForm extends StatelessWidget {
  String tipo;
  var icone;
  bool obscuro;
  var form;
  var valor;
  int maxlines;
  var keyboard;
  var formato;
  String helperText;
  InputForm(
      {Key? key,
      required this.helperText,
      required this.tipo,
      required this.icone,
      required this.obscuro,
      required this.valor,
      required this.form,
      required this.maxlines,
      required this.formato,
      required this.keyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: form,
          child: TextFormField(
            controller: valor,
            maxLines: maxlines,
            minLines: 1,
            style: const TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: tipo,
              prefixIcon: icone,
              
              hintText: helperText
            ),
            keyboardType: keyboard,
            inputFormatters: [formato],
            validator: (value) {
              if (value!.isEmpty) {
                if (tipo.toLowerCase() == 'senha') {
                  return 'Informe a $tipo';
                }
                return 'Informe o $tipo';
              } else if (tipo.toLowerCase() == 'senha' && value.length < 6) {
                return 'Sua senha deve ter no minimo 6 caracteres';
              } else if (tipo.toLowerCase() == 'e-mail' &&
                  isMail(value) == false) {
                return 'E-mail inválido';
              } else if (tipo.toLowerCase() == 'cpf' && isCPF(value) == false) {
                return 'CPF inválido';
              }
              return null;
            },
            onChanged: (value) {
              valor = value;
            },
            obscureText: obscuro,
          ),
        ));
  }
}
