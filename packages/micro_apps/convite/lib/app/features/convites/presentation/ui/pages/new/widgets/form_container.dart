// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:convite/app/features/convites/presentation/ui/pages/new/widgets/show_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../models/contato_model.dart';
import 'contatos_search.dart';
import 'input_form.dart';

class FormContainer extends StatefulWidget {
  var valorData;
  var valorHorarioInicio;
  var valorHorarioFim;
  var valorName;
  var formName;
  var valorDoc;
  var formDoc;
  var formContato;
  var valorContato;
  List<ContatoModel> allContatosUser;

  FormContainer({
    Key? key,
    required this.valorData,
    required this.valorHorarioInicio,
    required this.valorHorarioFim,
    required this.valorName,
    required this.formName,
    required this.valorDoc,
    required this.formDoc,
    required this.formContato,
    required this.valorContato,
    required this.allContatosUser,
  }) : super(key: key);

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  @override
  Widget build(BuildContext context) {
    bool showContatos = false;
    if (widget.allContatosUser.isNotEmpty) {
      setState(() {
        showContatos = true;
      });
    }
    return Column(
      children: [
        Visibility(
          visible: showContatos,
          child: ContatosSearch(
            allContatosUser: widget.allContatosUser,
            valorDoc: widget.valorDoc,
            valorName: widget.valorName,
            formContato: widget.formContato,
            valorContato: widget.valorContato,
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: InputForm(
                tipo: 'Nome Completo',
                icone: const Icon(Icons.account_circle),
                obscuro: false,
                valor: widget.valorName,
                form: widget.formName,
                maxlines: 1,
                keyboard: TextInputType.name,
                formato: FilteringTextInputFormatter.singleLineFormatter,
              ),
            ),
            InputForm(
              tipo: 'Documento com Foto',
              icone: Icon(Icons.account_box_rounded),
              obscuro: false,
              valor: widget.valorDoc,
              form: widget.formDoc,
              maxlines: 1,
              keyboard: TextInputType.number,
              formato: FilteringTextInputFormatter.singleLineFormatter,
              helperText: 'RG, CNH ou CTPS',
            ),
          ],
        ),
        ShowDateTime(
          valorData: widget.valorData,
          valorHoraFim: widget.valorHorarioFim,
          valorHoraInicio: widget.valorHorarioInicio,
        ),
      ],
    );
  }
}
