import 'package:flutter/material.dart';
import 'logo_button.dart';

class SocialAccount extends StatelessWidget {
  double heightScreen;
  SocialAccount({Key? key, required this.heightScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: heightScreen*0.85),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Cadastre-se com:',
                style: TextStyle(
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                LogoButton(image: 'images/g.png'),
                LogoButton(image: 'images/fb.png'),

              ],
            ),
          ],
        ),
      ),

    );
  }
}
