import 'package:flutter/material.dart';
import 'logo_button.dart';

class SocialAccount extends StatelessWidget {
  double heightScreen;
  SocialAccount({Key? key, required this.heightScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Entrar com:',
              style: TextStyle(
                  fontWeight: FontWeight.w300
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              LogoButton(image: 'images/fb.png'),
              LogoButton(image: 'images/g.png'),

            ],
          ),
        ],
      ),
    );
  }
}
