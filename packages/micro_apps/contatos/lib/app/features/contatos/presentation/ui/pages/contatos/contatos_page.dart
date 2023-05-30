import 'package:contatos/app/features/contatos/controllers/contato_controller.dart';
import 'package:contatos/app/features/contatos/services/clients/dio_client.dart';
import 'package:contatos/app/features/contatos/services/requests/contatos_services.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import '../../../../models/contato_model.dart';
import 'widgets/contato.dart';

class ContatosPage extends StatefulWidget {
  ContatosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  @override
  void initState() {
    super.initState();
    contatoController.getContatosUsuario();
  }

  var cor;
  var contatoController = ContatoController(ContatoService(DioClient()));

  @override
  void dispose() {
    super.dispose();
    contatoController.dispose();
  }

  bool selectedConvidado = true;
  bool selectedPrestador = true;

  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.1,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      navigatorKey.currentState?.pushReplacementNamed('/home');
                    },
                    child: Icon(Icons.arrow_back_outlined,
                        color: Theme.of(context).highlightColor),
                  ),
                ),
              ),
              Container(
                width: width * 0.6,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage('images/black.png'),
                      opacity: 0.05,
                      fit: BoxFit.cover,
                    )),
                child: Center(
                    child: Text(
                  'Contatos',
                  style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 40),
                )),
              ),
              SizedBox(
                width: width * 0.1,
                child: Center(
                  child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.help,
                          color: Theme.of(context)
                              .highlightColor
                              .withOpacity(0.7))),
                ),
              )
            ],
          ),
        ),
      ),
      body: AnimatedBuilder(
          animation: contatoController,
          builder: (context, widget) {
            if (contatoController.allContatosUser.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Sem contatos por enquanto',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              );
            } else {
              List<ContatoModel> allContatos =
                  contatoController.allContatosUser;

              return ListView.builder(
                  itemCount: allContatos.length,
                  itemBuilder: (context, index) {
                    final contato =
                        allContatos[allContatos.length - (index + 1)];

                    return Contato(
                      controller: contatoController,
                      contato: contato,
                      cor: Theme.of(context).primaryColor,
                    );
                  });
            }
          }),
    );
  }
}
