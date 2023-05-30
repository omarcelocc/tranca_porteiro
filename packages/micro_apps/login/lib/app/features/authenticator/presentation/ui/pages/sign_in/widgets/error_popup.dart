import 'package:flutter/material.dart';

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(
      child: Text('Erro de Conexão'),
      onPressed: (){},

    ));
  }
}