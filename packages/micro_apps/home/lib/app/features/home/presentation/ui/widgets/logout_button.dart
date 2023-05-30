import 'dart:async';

import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../../services/auth/auth_service.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  bool tapped = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          if (tapped) {
            tapped = !tapped;
          }
        });
        bool logout = await AuthService().logout();

        if (logout) {
          Timer(Duration(milliseconds: 500), () {
            navigatorKey.currentState?.pushReplacementNamed('/splash');
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 40,
        width: tapped ? 100 : 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).errorColor,
                  Theme.of(context).errorColor.withOpacity(0.5)
                ],
                begin: const FractionalOffset(0, 0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage('images/black.png'),
              opacity: 0.05,
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Container(
            child: Center(
                child: tapped
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Sair',
                            style: TextStyle(
                                color: Theme.of(context).errorColor.withRed(255).withGreen(150).withBlue(150),
                                //fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.logout,
                            color: Theme.of(context).errorColor.withRed(255).withGreen(150).withBlue(150),
                          )
                        ],
                      )
                    : CircularProgressIndicator(
                        color: Theme.of(context).indicatorColor,
                      )),
          ),
        ),
      ),
    );
  }
}
