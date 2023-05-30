// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:convite/app/features/convites/presentation/ui/pages/all/convite_page.dart';
import 'package:convite/app/features/convites/presentation/ui/pages/new/new_invite_page.dart';
import 'package:dependencies/app/base_api/services/clients/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../../../controllers/convite_controller.dart';
import '../../../../services/requests/convite_service.dart';

class NavigatorScreen extends StatefulWidget {
  int index;

  NavigatorScreen({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState(index);
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int index;
  _NavigatorScreenState(this.index);
  final valorIndex = TextEditingController();

  //lista de páginas da pageView

  //Controlador da pageView
  late PageController pgController;
  //duração da transação entre as telas
  Duration duration = const Duration(milliseconds: 300);
  //tipo de curva da animação
  Curve curve = Curves.ease;
  var conviteController = ConviteController(ConviteService(DioClient()));
  final iconController = TextEditingController();
  @override
  initState() {
    //iniciando o controlador
    conviteController.getConvitesUsuario();

   
    pgController = PageController(initialPage: index);
    //iniciando o controllador de convites
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pgController.dispose();
    conviteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      NewInvitePage(),
      ConvitePage(
        conviteController: conviteController,
        filtro: '',
      ),
      ConvitePage(
        conviteController: conviteController,
        filtro: 'ATIVO',
      ),
      ConvitePage(
        conviteController: conviteController,
        filtro: 'FINALIZADO',
      ),
      ConvitePage(
        conviteController: conviteController,
        filtro: 'EXPIRADO',
      ),
    ];
    valorIndex.text = index.toString();
    index = int.parse(valorIndex.text);
    Color itemSelectedColor = Theme.of(context).highlightColor;
    Color itemColor = Colors.white.withOpacity(0.8);
    double wight = MediaQuery.of(context).size.width;
    //lista de icones da barra de navegação
    List<Widget> items = [
      IconButton(
        onPressed: () {
          setState(() {
            index = 0;
            pgController.animateToPage(index, duration: duration, curve: curve);
          });
        },
        icon: Icon(
          Icons.add,
          //semanticLabel: 'Criar',
          color: index == 0 ? itemSelectedColor : itemColor,
        ),
        visualDensity: VisualDensity(horizontal: 1, vertical: 1),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            index = 1;
            pgController.animateToPage(index, duration: duration, curve: curve);
          });
        },
        icon: Text(
          'Todos',
          style: TextStyle(
              fontWeight: index == 1 ? FontWeight.w900 : FontWeight.w500,
              color: index == 1 ? itemSelectedColor : itemColor),
        ),
        iconSize: 50,
      ),
      IconButton(
        onPressed: () {
          setState(() {
            index = 2;
            pgController.animateToPage(index, duration: duration, curve: curve);
          });
        },
        icon: Text(
          'Ativos',
          style: TextStyle(
              fontWeight: index == 2 ? FontWeight.w900 : FontWeight.w500,
              color: index == 2 ? itemSelectedColor : itemColor),
        ),
        iconSize: 50,
      ),
      IconButton(
        onPressed: () {
          setState(() {
            index = 3;
            pgController.animateToPage(index, duration: duration, curve: curve);
          });
        },
        icon: Text(
          'Finalizados',
          style: TextStyle(
              fontWeight: index == 3 ? FontWeight.w900 : FontWeight.w500,
              color: index == 3 ? itemSelectedColor : itemColor,
              fontSize: wight * 0.03),
        ),
        iconSize: 75,
      ),
      IconButton(
        enableFeedback: false,
        onPressed: () {
          setState(() {
            index = 4;
            pgController.animateToPage(index, duration: duration, curve: curve);
          });
        },
        icon: Text(
          'Expirados',
          style: TextStyle(
              fontWeight: index == 4 ? FontWeight.w900 : FontWeight.w500,
              color: index == 4 ? itemSelectedColor : itemColor,
              fontSize: wight * 0.03),
        ),
        iconSize: 70,
      ),
    ];

    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        controller: pgController,
        children: pages,
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: wight * 0.1,
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
                width: wight * 0.6,
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
                  'Convites',
                  style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 40),
                )),
              ),
              SizedBox(
                width: wight * 0.1,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        navigatorKey.currentState
                            ?.pushReplacementNamed('/home');
                      },
                      child: iconController.text != 'deletar'
                          ? Icon(Icons.help,
                              color: Theme.of(context)
                                  .highlightColor
                                  .withOpacity(0.7))
                          : IconButton(
                              onPressed: () async {},
                              icon: Icon(Icons.delete,
                                  color: Theme.of(context).errorColor),
                            )),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: NavigationBar(
          //animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).primaryColor,
          surfaceTintColor: Theme.of(context).primaryColorLight,
          //backgroundColor: Colors.transparent,
          destinations: items,
          selectedIndex: index,
          height: 60,
          onDestinationSelected: (index) {
            this.index = index;
          },
        ),
      ),
    );
  }
}
