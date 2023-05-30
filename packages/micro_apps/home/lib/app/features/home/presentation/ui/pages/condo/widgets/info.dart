import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  IconData icon;
  String atributo;
  String dado;
  Info({required this.atributo, required this.dado, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      width: width * 0.85,
      height: height * 0.1,
      child: Container(
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
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Icon(icon,                 color: Colors.white,),

              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('$atributo: ',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: dado==null?CircularProgressIndicator(color: Colors.white,): Text('$dado',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
