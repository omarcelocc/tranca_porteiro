// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class Options extends StatelessWidget {
  IconData icon;
  String text;
  String rota;
  Options({
    Key? key,
    required this.icon,
    required this.text,
    required this.rota,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      width: width * 0.4,
      height: width * 0.4,
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
        child: SizedBox(
          width: width * 0.4,
          height: width * 0.4,
          child: IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Icon(
                    icon,
                    size: width * 0.12,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04),
                )
              ],
            ),
            onPressed: () {
              navigatorKey.currentState?.pushReplacementNamed(rota);            },
            color: Colors.white.withOpacity(0.85),
          ),
        ),
      ),
    );
  }
}
