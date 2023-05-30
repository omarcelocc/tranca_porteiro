import 'dart:async';

import 'package:dependencies/app/internet_connection/services/clients/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../services/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final internet = InternetConnection();

  @override
  void initState() {
    internet.getConectividade(context);
    super.initState();
  }

  @override
  void dispose() {
    internet.subscription.cancel();
    super.dispose();
  }

  bool _isVisible = false;

  _SplashScreenState() {
    verificando();

    Timer(const Duration(milliseconds: 10), () {
      setState(() => _isVisible = true);
    });
  }

  verificando() {
    Auth().verificarToken().then((value) {
      Timer(const Duration(milliseconds: 1500), () {
        if (internet.estaConectado) {
          if (value) {
            navigatorKey.currentState?.pushReplacementNamed('/home');
          } else {
            navigatorKey.currentState?.pushReplacementNamed('/login');
          }
        } else {
          if (internet.mostrandoPopUp == false) {
            internet.popUpInternet(context);
            setState(() {
              internet.mostrandoPopUp = true;
            });
          }
          verificando();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight
            ],
            begin: const FractionalOffset(0, 0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0,
            duration: const Duration(milliseconds: 1200),
            child: Center(
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logo_tranca.png'),
                        opacity: 1.0 //opacidade
                        )),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: height * 0.9),
              //alignment: Alignment.centerLeft,
              height: 70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/seeds_splash.png'),
                      opacity: 0.4)),
            ),
          ),
        ],
      ),
    );
  }
}
