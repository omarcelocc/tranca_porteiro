import 'package:flutter/material.dart';
import 'package:home/app/features/home/controllers/condominio_controller.dart';
import 'package:home/app/features/home/controllers/user_controller.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/home_screen.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/loading_home_screen.dart';

class LoadingHome extends StatefulWidget {
  UserController controllerUser;
  CondominioController controllerCondo;
  LoadingHome(
      {required this.controllerUser, required this.controllerCondo, super.key});

  @override
  State<LoadingHome> createState() =>
      _LoadingHomeState(controllerUser, controllerCondo);
}

class _LoadingHomeState extends State<LoadingHome> {
  bool dados = false;
  UserController controllerUser;
  CondominioController controllerCondo;
  _LoadingHomeState(this.controllerUser, this.controllerCondo);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controllerUser,
        builder: (context, widget) {
          if (controllerUser.usuarioLocal != null &&
              controllerCondo.condominioLocal != null) {
            return HomeScreen(
              nome: controllerUser.usuarioLocal.nome,
            );
          } else if (controllerUser.usuario != null &&
              controllerCondo.condominio != null) {
            return HomeScreen(
              nome: controllerUser.usuario.nome,
            );
          }
           else {
            return LoadingHomeScreen(dados: controllerUser.loading);
          }
        });
  }
}
