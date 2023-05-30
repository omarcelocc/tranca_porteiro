import 'package:flutter/material.dart';
import 'package:login/app/features/authenticator/presentation/ui/pages/login/login_screen.dart';

class RecoveryButton extends StatelessWidget {
  var widthScreen;
  RecoveryButton({Key? key, required this.widthScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: widthScreen*0.5, bottom: 40),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
          print('clicou');
        },
        child: Text(
          'Esqueceu a senha?',
          style: TextStyle(
              color: Colors.black54,
              decoration: TextDecoration.underline
          ),
        ),
      ),
    );
  }
}
