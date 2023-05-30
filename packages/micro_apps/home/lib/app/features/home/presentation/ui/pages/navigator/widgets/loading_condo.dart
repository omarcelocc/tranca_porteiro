import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/features/home/controllers/condominio_controller.dart';
import 'package:home/app/features/home/controllers/user_controller.dart';
import 'package:home/app/features/home/models/condominio_model.dart';
import 'package:home/app/features/home/presentation/ui/pages/condo/condo_page.dart';

class LoadingCondo extends StatefulWidget {
  CondominioController controllerCondo;
  LoadingCondo(
      { required this.controllerCondo, super.key});

  @override
  State<LoadingCondo> createState() =>
      _LoadingCondoState(controllerCondo);
}

class _LoadingCondoState extends State<LoadingCondo> {
  CondominioController controllerCondo;
  _LoadingCondoState(this.controllerCondo);
  final  CondominioLocal _condominioLocal = CondominioLocal();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controllerCondo,
        builder: (context, widget) {
          if (controllerCondo.condominioLocal != null) {
            return CondoPage(
              condominio: controllerCondo.condominioLocal,
            );
          }else if (controllerCondo.condominio != null) {
            return CondoPage(
              condominio: controllerCondo.condominio,
            );
          } 
           else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
