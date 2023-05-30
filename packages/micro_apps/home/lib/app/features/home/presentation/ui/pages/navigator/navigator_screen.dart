import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:home/app/features/home/controllers/condominio_controller.dart';
import 'package:home/app/features/home/controllers/user_controller.dart';
import 'package:home/app/features/home/presentation/ui/pages/navigator/widgets/loading_condo.dart';
import 'package:home/app/features/home/presentation/ui/pages/navigator/widgets/loading_home.dart';
import 'package:home/app/features/home/presentation/ui/pages/navigator/widgets/loading_perfil.dart';
import 'package:home/app/features/home/presentation/ui/pages/notificacao/notify_page.dart';
import 'package:home/app/features/home/services/requests/get_user_service.dart';

import '../../../../services/clients/dio_client.dart';
import '../../../../services/requests/condominio_service.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int index = 2;

  //Controlador da pageView
  late PageController pgController;
  //duração da transação entre as telas
  Duration duration = const Duration(milliseconds: 300);
  //tipo de curva da animação
  Curve curve = Curves.ease;
  final controllerCondo = CondominioController(CondominioService(DioClient()));
  final controllerUser = UserController(UserService(DioClient()));
  @override
  initState() {
    controllerUser.getUser();
    controllerCondo.getCondo();
    controllerUser.getUserLocal();
    controllerCondo.getCondoLocal();
    pgController = PageController(initialPage: index);
    super.initState();
    //iniciando o controlador
  }

  @override
  Widget build(BuildContext context) {
    //lista de páginas da pageView
    final pages = [
      LoadingCondo(controllerCondo: controllerCondo),
      LoadingPerfil(controllerUser: controllerUser),
      LoadingHome(
          controllerUser: controllerUser, controllerCondo: controllerCondo),
      NotifyPage(),
      LoadingHome(
          controllerUser: controllerUser, controllerCondo: controllerCondo),
    ];
    //lista de icones da barra de navegação
    List<Widget> items = [
      IconButton(
          onPressed: () {
            setState(() {
              index = 0;
              pgController.animateToPage(index,
                  duration: duration, curve: curve);
            });
          },
          icon: const Icon(Icons.home_work)),
      IconButton(
          onPressed: () {
            setState(() {
              index = 1;
              pgController.animateToPage(index,
                  duration: duration, curve: curve);
            });
          },
          icon: const Icon(Icons.person)),
      IconButton(
          onPressed: () {
            setState(() {
              index = 2;
              pgController.animateToPage(index,
                  duration: duration, curve: curve);
            });
          },
          icon: const Icon(Icons.home)),
      IconButton(
          onPressed: () {
            setState(() {
              index = 3;
              pgController.animateToPage(index,
                  duration: duration, curve: curve);
            });
          },
          icon: const Icon(Icons.notifications)),
      IconButton(
          onPressed: () {
            setState(() {
              index = 4;
              pgController.animateToPage(index,
                  duration: duration, curve: curve);
            });
          },
          icon: const Icon(Icons.settings)),
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
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColorLight,
          backgroundColor: Colors.transparent,
          items: items,
          index: index,
          height: 60,
          onTap: (index) {
            this.index = index;
          },
        ),
      ),
    );
  }
}
