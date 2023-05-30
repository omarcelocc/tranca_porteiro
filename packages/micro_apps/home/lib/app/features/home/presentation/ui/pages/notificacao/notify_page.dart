import 'package:flutter/material.dart';
import 'package:home/app/features/home/presentation/ui/pages/notificacao/widgets/notificacao.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  List<Map<String, dynamic>> allNotificacoes = [
    {
      'nome': 'fulano de tal',
      'tipo': 'Convidado',
    },
    {
      'nome': 'Marcelo cc',
      'tipo': 'Convidado',
    },
    {
      'nome': 'Rodrigo',
      'tipo': 'Convidado',
    },
    {
      'nome': 'fulana de tal',
      'tipo': 'Convidado',
    },
    {
      'nome': 'elda',
      'tipo': 'Convidado',
    },
    {
      'nome': 'yonara',
      'tipo': 'Convidado',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: width*0.6,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage('images/black.png'),
                      opacity: 0.05,
                      fit: BoxFit.cover,
                    )),
                child: Center(
                    child: Text(
                  'Notificações',
                  style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 35),
                )),
              ),
              
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: allNotificacoes.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> notificacao = allNotificacoes[index];
            return Notificacao(
                nome: notificacao['nome'],
                tipo: notificacao['tipo'],
                cor: Theme.of(context).primaryColor);
          }),
    );
  }
}
