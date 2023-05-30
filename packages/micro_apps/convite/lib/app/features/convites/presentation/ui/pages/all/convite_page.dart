// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:convite/app/features/convites/controllers/convite_controller.dart';
import 'package:convite/app/features/convites/models/convite_model.dart';
import 'package:convite/app/features/convites/presentation/ui/pages/all/widgets/convite.dart';

import 'package:flutter/material.dart';


class ConvitePage extends StatefulWidget {
  ConviteController conviteController;
  String filtro;

  ConvitePage({
    Key? key,
    required this.conviteController,
    required this.filtro,
  }) : super(key: key);

  @override
  State<ConvitePage> createState() =>
      _ConvitePageState(conviteController, filtro);
}

class _ConvitePageState extends State<ConvitePage> {
  var cor;
  ConviteController conviteController;
  String filtro;
  _ConvitePageState(this.conviteController, this.filtro);

  bool selectedConvidado = true;
  bool selectedPrestador = true;

  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: conviteController,
        builder: (context, widget) {
          if (conviteController.allConvitesUser.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'Sem convites por enquanto',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            );
          } else {
            List<ConviteModel> allConvites = [];
            if (filtro != '') {
              for (var convite in conviteController.allConvitesUser) {
                if (convite.status == filtro) {
                  //print(convite.status);
                  allConvites.add(convite);
                }
              }
            } else {
              allConvites = conviteController.allConvitesUser;
            }
            print(allConvites);
            return allConvites.isNotEmpty
                ? ListView.builder(
                    itemCount: allConvites.length,
                    itemBuilder: (context, index) {
                      final convite = allConvites[index];
                      if (convite.status == 'FINALIZADO') {
                        cor = Theme.of(context).primaryColor;
                      } else if (convite.status == 'EXPIRADO') {
                        cor = Theme.of(context).errorColor.withOpacity(0.8);
                      } else {
                        cor = Colors.green;
                      }
                      return Convite(
                        convite: convite,
                        cor: cor,
                      );
                    })
                : Center(
                    child: Text(
                      'Você não tem convites ${filtro.toLowerCase()}s!',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  );
          }
        });
  }
}
