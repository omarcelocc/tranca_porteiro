import 'package:flutter/material.dart';

class Cabecalho extends StatelessWidget {
  double width;
  double height;

  String userName = 'Morador';
  Cabecalho({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.2,
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
                padding: EdgeInsets.only(left: width*0.04, top: height*0.015),
                //height: height*0.06,
                //width: width* 0.3,

                child: Text(
                  'Perfil',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.yellow.shade300),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*0.015),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
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
              padding: EdgeInsets.only(top: height*0.055, left: width*0.04),
              child: Text(
                'Olá, $userName!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
