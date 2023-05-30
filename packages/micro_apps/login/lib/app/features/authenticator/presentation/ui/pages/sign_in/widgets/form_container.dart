// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/app/features/authenticator/controllers/condo_controller.dart';
import 'package:login/app/features/authenticator/models/condo_model.dart';
import 'package:login/app/features/authenticator/presentation/ui/pages/sign_in/widgets/condo_search.dart';
import 'package:login/app/features/authenticator/presentation/ui/pages/sign_in/widgets/show_date_time.dart';
import 'input_form.dart';

class FormContainer extends StatelessWidget {
  List<CondoModel> condos;
  var valorUnidade;
  var formUnidade;
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

  FormContainer(
      {Key? key,
      required this.condos,
      required this.valorUnidade,
      required this.formUnidade,
      required this.valorCondo,
      required this.formCondo,
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        CondoSearch(
          condos: condos,
          valorCondo: valorCondo,
          formCondo: formCondo,
        ),
        Center(child: ShowDateTime(data: valorData)),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: InputForm(
            tipo: 'Nome',
            icone: const Icon(Icons.account_circle),
            obscuro: false,
            valor: valorName,
            form: formName,
            maxlines: 1,
            keyboard: TextInputType.name,
            formato: FilteringTextInputFormatter.singleLineFormatter,
            helperText: '',
          ),
        ),
        InputForm(
          tipo: 'Sobrenome',
          icone: Icon(Icons.account_circle_outlined),
          obscuro: false,
          valor: valorLastname,
          form: formLastname,
          maxlines: 1,
          keyboard: TextInputType.name,
          formato: FilteringTextInputFormatter.singleLineFormatter,
          helperText: '',
        ),
        InputForm(
          tipo: 'CPF',
          icone: Icon(Icons.account_box_rounded),
          obscuro: false,
          valor: valorCpf,
          form: formCpf,
          maxlines: 1,
          keyboard: TextInputType.number,
          formato: FilteringTextInputFormatter.singleLineFormatter,
          helperText: 'Sem pontos ou traços',
        ),
        InputForm(
          tipo: 'Unidade',
          icone: Icon(Icons.house_rounded),
          obscuro: false,
          valor: valorUnidade,
          form: formUnidade,
          maxlines: 1,
          keyboard: TextInputType.name,
          formato: FilteringTextInputFormatter.singleLineFormatter,
          helperText: 'Bloco e Apartamento',
        ),
        InputForm(
          tipo: 'E-mail',
          icone: Icon(Icons.email),
          obscuro: false,
          valor: valorUser,
          form: formUser,
          maxlines: 1,
          keyboard: TextInputType.emailAddress,
          formato: FilteringTextInputFormatter.singleLineFormatter,
          helperText: '',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InputForm(
            tipo: 'Senha',
            icone: Icon(Icons.lock),
            obscuro: true,
            valor: valorPass,
            form: formPass,
            maxlines: 1,
            keyboard: TextInputType.name,
            formato: FilteringTextInputFormatter.singleLineFormatter,
            helperText: '',
          ),
        ),
      ],
    );
  }
}
