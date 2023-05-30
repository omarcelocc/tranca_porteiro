
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:login/app/features/authenticator/controllers/condo_controller.dart';
import 'package:login/app/features/authenticator/services/auth/condo_service.dart';
import 'package:login/app/features/authenticator/services/clients/dio_client.dart';
import 'widgets/form_container.dart';
import 'widgets/header_widget.dart';
import 'widgets/register_button.dart';
import 'widgets/back_login_button.dart';
import 'widgets/titulo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CondoController controller = CondoController(CondoService(DioClient()));
  @override
  void initState() {
      controller.get();
    
    super.initState();
  }

 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //Controlador e Key para o formulário de condominio
  final _formCondo = GlobalKey<DropdownSearchState>();
  final _valorCondo = TextEditingController();

  //Controlador e Key para o formulário de nome
  final _formName = GlobalKey<FormState>();
  final _valorName = TextEditingController();

  //Controlador e Key para o formulário de sobrenome
  final _formLastname = GlobalKey<FormState>();
  final _valorLastname = TextEditingController();

  //Controlador e Key para o formulário de Usuário(email)
  final _formUser = GlobalKey<FormState>();
  final _valorUser = TextEditingController();

  //Controlador e Key para o formulário de CPF
  final _formCpf = GlobalKey<FormState>();
  final _valorCpf = TextEditingController();

  //Controlador e Key para o formulário de senha
  final _formPass = GlobalKey<FormState>();
  final _valorPass = TextEditingController();
  //Controlador e Key para o formulário de unidade
  final _formUnidade = GlobalKey<FormState>();
  final _valorUnidade = TextEditingController();
  //Controlador e Key para o formulário de senha
  final _valorData = TextEditingController();
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
              //CABEÇALHO
              SizedBox(
                height: heightScreen * 0.2,
                child: HeaderWidget(heightScreen * 0.2, true),
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (context, widget) {
                  if (controller.todos.length == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else {
                    final todos = controller.todos;

                    return SizedBox(
                      width: widthScreen * 0.9,
                      child: Column(
                        children: [
                          //TITULO
                          Titulo(
                              titulo: 'Bem-Vindo!',
                              descricao: 'Insira suas informações'),

                          //FORMULÁRIO
                          FormContainer(
                            condos: todos,
                            formUnidade: _formUnidade,
                            valorUnidade: _valorUnidade,
                            valorCondo: _valorCondo,
                            formCondo: _formCondo,
                            valorName: _valorName,
                            formName: _formName,
                            valorLastname: _valorLastname,
                            formLastname: _formLastname,
                            valorCpf: _valorCpf,
                            formCpf: _formCpf,
                            formUser: _formUser,
                            valorUser: _valorUser,
                            formPass: _formPass,
                            valorPass: _valorPass,
                            valorData: _valorData,
                          ),

                          //BOTÃO CADASTRO
                          RegisterButton(
                            valorUnidade: _valorUnidade,
                            formUnidade: _formUnidade,
                            valorCondo: _valorCondo,
                            formCondo: _formCondo,
                            valorName: _valorName,
                            formName: _formName,
                            valorLastname: _valorLastname,
                            formLastname: _formLastname,
                            valorCpf: _valorCpf,
                            formCpf: _formCpf,
                            formUser: _formUser,
                            valorUser: _valorUser,
                            formPass: _formPass,
                            valorPass: _valorPass,
                            valorData: _valorData,
                          ),

                          //BOTÃO DE VOLTAR
                        ],
                      ),
                    );
                  }
                },
              ),
              BackLoginButton() //Corpo principal
            ],
          ),
        ),
      ),
    );
  }

}
