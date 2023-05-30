import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/features/home/controllers/condominio_controller.dart';
import 'package:home/app/features/home/controllers/user_controller.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/home_screen.dart';
import 'package:home/app/features/home/presentation/ui/pages/profile/profile_page.dart';

import '../../../../../models/user_model.dart';

class LoadingPerfil extends StatefulWidget {
  UserController controllerUser;
  LoadingPerfil(
      {required this.controllerUser, super.key});

  @override
  State<LoadingPerfil> createState() =>
      _LoadingPerfilState(controllerUser);
}

class _LoadingPerfilState extends State<LoadingPerfil> {
  UserController controllerUser;
  _LoadingPerfilState(this.controllerUser);
  UsuarioLocal usuarioLocal = UsuarioLocal();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controllerUser,
        builder: (context, widget) {
          if (controllerUser.usuarioLocal != null) {
            return ProfilePage(
              usuario: controllerUser.usuarioLocal,
            );
          } else if (controllerUser.usuario != null) {
            return ProfilePage(
                usuario: controllerUser.usuario);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
