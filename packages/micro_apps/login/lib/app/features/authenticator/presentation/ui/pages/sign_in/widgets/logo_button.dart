import 'package:flutter/material.dart';


class LogoButton extends StatelessWidget {
  String image;
  LogoButton({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.black12,
                offset: Offset.zero,
                blurRadius: 0.5,
                spreadRadius: 0.5,

              )],
              image: DecorationImage(
                  image: AssetImage(image),
                  opacity: 1.0 //opacidade
              )
          ),
        ),
      ),
    );
  }
}
