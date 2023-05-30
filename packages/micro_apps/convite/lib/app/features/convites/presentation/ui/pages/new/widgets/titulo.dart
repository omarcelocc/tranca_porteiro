import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  String titulo;
  String descricao;
  Titulo({Key? key, required this.titulo, required this.descricao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryColorLight
                ),
              ),
            ),
            Center(
              child: Text(
                descricao,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColorLight
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
