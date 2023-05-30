import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class BackLoginButton extends StatelessWidget {
  const BackLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: 7, bottom: 40),
      child: InkWell(
        onTap: (){
          navigatorKey.currentState?.pushReplacementNamed('/login');
          print('clicou voltar ao login');
        },
        child: Text(
          'Voltar',
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColorLight,
              decoration: TextDecoration.underline
          ),
        ),
      ),
    );
  }
}
