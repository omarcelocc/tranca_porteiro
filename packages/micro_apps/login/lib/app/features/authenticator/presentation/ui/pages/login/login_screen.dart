import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/form_container.dart';
import 'widgets/header_widget.dart';
import 'widgets/login_button.dart';
import 'widgets/recovery_button.dart';
import 'widgets/register_button.dart';
import 'widgets/social_account.dart';
import 'widgets/titulo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formUser = GlobalKey<FormState>();
  final _valorUser = TextEditingController();
  final _formPass = GlobalKey<FormState>();
  final _valorPass = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Column(
                children: [

                  //CABEÇALHO DA HOME
                  SizedBox(
                    height: heightScreen*0.32,
                    child: HeaderWidget(heightScreen*0.32, true),
                  ),


                  SizedBox(
                    height: heightScreen*0.56,
                    width: widthScreen * 0.90,
                    child: Column(
                      children: [
                        //TITULO
                        Titulo(titulo: 'Olá!', descricao: 'Entre com a sua conta'),

                        //FORMULÁRIO
                        FormContainer(formUser: _formUser, valorUser: _valorUser, formPass: _formPass, valorPass: _valorPass),

                        //BOTÃO ESQUECEU A SENHA
                        RecoveryButton(widthScreen: widthScreen),

                        //BOTÃO LOGIN
                        LoginButton(formPass: _formPass, formUser: _formUser, valorPass: _valorPass, valorUser: _valorUser,),

                        //BOTÃO DE CADASTRO
                        RegisterButton(),
                                                SocialAccount(heightScreen: heightScreen*0.1),

                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [

                        SizedBox(
                          width: widthScreen*0.25,
                          height: heightScreen*0.08,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                           decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/seeds.png'))
                           ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            
              
                  
              //ENTRAR COM AS REDES SOCIAIS
            ],
          ),
        ),
      ),
    );
  }
}
