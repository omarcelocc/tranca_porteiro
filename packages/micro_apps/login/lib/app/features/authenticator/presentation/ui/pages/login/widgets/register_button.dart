import 'package:flutter/material.dart';
//import 'package:login/app/features/authenticator/presentation/ui/pages/login/login_screen.dart';

import '../../sign_in/register_screen.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(top: 7, bottom: 20),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const RegisterScreen()), (route) => false);

          print('clicou');
        },
        child: Text(
          'Não tem uma conta? Cadastre-se!',
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
