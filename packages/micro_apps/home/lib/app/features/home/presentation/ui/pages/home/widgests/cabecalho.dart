import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class Cabecalho extends StatelessWidget {
  double width;
  double height;

  String nome;
  Cabecalho({required this.height, required this.width,required this.nome, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.20,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: height*0.22,
                height: height*0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/tranca.png'),
                    opacity: 0.9
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.015),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.help, color: Colors.white))
                  ],
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: height * 0.055, left: width * 0.04),
              child: Text(
                'Olá, $nome!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
