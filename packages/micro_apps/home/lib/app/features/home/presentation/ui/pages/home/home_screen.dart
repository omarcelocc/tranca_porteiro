import 'package:flutter/material.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/widgests/cabecalho.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/widgests/menu.dart';

class HomeScreen extends StatefulWidget {
  String nome;
  HomeScreen({required this.nome, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState(nome);
}

class _HomeScreenState extends State<HomeScreen> {
  String nome;
  _HomeScreenState(this.nome);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListView(children: [
        Column(children: [
          Cabecalho(height: height, width: width, nome: nome,),
          const Menu(),
        ]),
      ]),
    );
  }
}
