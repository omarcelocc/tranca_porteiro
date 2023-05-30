import 'package:convite/app/features/convites/presentation/ui/pages/new/widgets/tipo_button.dart';
import 'package:convite/app/features/convites/services/requests/contatos_services.dart';
import 'package:dependencies/app/base_api/services/clients/dio_client.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/contato_controller.dart';
import 'widgets/form_container.dart';
import 'widgets/register_button.dart';

import 'widgets/titulo.dart';

class NewInvitePage extends StatefulWidget {
  NewInvitePage({Key? key}) : super(key: key);

  @override
  State<NewInvitePage> createState() => _NewInvitePageState();
}

class _NewInvitePageState extends State<NewInvitePage> {
  var contatoController = ContatoController(ContatoService(DioClient()));
  @override
  void initState() {
    contatoController.getContatosUsuario();
    super.initState();
  }

  @override
  void dispose() {
    contatoController.dispose();
    super.dispose();
  }

  final _formContato = GlobalKey<DropdownSearchState>();
  final _valorContato = TextEditingController();

  final _formName = GlobalKey<FormState>();
  final _valorName = TextEditingController();

  final _formDoc = GlobalKey<FormState>();
  final _valorDoc = TextEditingController();

  final _valorHoraFim = TextEditingController();
  final _valorData = TextEditingController();
  final _valorHoraInicio = TextEditingController();
  final valorTipo = TextEditingController();
  final _valorSalvar = TextEditingController();

  bool selectedConvidado = true;
  bool selectedPrestador = false;
  bool selectedSalvar = false;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: widthScreen * 0.9,
                  child: Column(
                    children: [
                      //TITULO
                      Titulo(
                          titulo: 'Novo Convite',
                          descricao: 'Insira os dados do seu novo convite'),

                      //FORMULÁRIO
                      AnimatedBuilder(
                        animation: contatoController,
                        builder: (context, widget) {
                          return FormContainer(
                            allContatosUser: contatoController.allContatosUser,
                            valorData: _valorData,
                            valorHorarioInicio: _valorHoraInicio,
                            valorHorarioFim: _valorHoraFim,
                            valorContato: _valorContato,
                            formContato: _formContato,
                            valorName: _valorName,
                            formName: _formName,
                            valorDoc: _valorDoc,
                            formDoc: _formDoc,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            valorTipo.text = 'CONVIDADO';
                                            selectedConvidado =
                                                !selectedConvidado;
                                            selectedPrestador =
                                                !selectedPrestador;
                                          });
                                          print(valorTipo.text);
                                        },
                                        icon: Icon(selectedConvidado
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank)),
                                    Text('Convidado')
                                  ]),
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            valorTipo.text = 'PRESTADOR';
                                            selectedConvidado =
                                                !selectedConvidado;
                                            selectedPrestador =
                                                !selectedPrestador;
                                          });
                                          print(valorTipo.text);
                                        },
                                        icon: Icon(selectedPrestador
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank)),
                                    Text('Prestador de Serviço')
                                  ]),
                                )
                              ]),
                        ),
                      ),

                      //BOTÃO CADASTRO
                      AnimatedBuilder(
                        animation: contatoController,
                        builder: (context, widget) {
                          return RegisterButton(
                              valorSalvar: _valorSalvar,
                              allContatosUser:
                                  contatoController.allContatosUser,
                              valorData: _valorData,
                              valorHorarioInicio: _valorHoraInicio,
                              valorHorarioFim: _valorHoraFim,
                              valorContato: _valorContato,
                              formContato: _formContato,
                              valorName: _valorName,
                              formName: _formName,
                              valorDoc: _valorDoc,
                              formDoc: _formDoc,
                              valorTipo: valorTipo);
                        },
                      ),
                      AnimatedContainer(
                        width: widthScreen,
                        duration: Duration(milliseconds: 500),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_valorSalvar.text == '') {
                                        _valorSalvar.text = 'salvar';
                                      } else {
                                        _valorSalvar.text = '';
                                      }

                                      selectedSalvar = !selectedSalvar;
                                    });
                                    print(valorTipo.text);
                                  },
                                  icon: Icon(selectedSalvar
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank)),
                              Text('Salvar Contato')
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
