// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TipoButton extends StatefulWidget {
  var valorTipo;

  TipoButton({
    Key? key,
    required this.valorTipo,
  }) : super(key: key);

  @override
  State<TipoButton> createState() => _TipoButtonState(valorTipo);
}

class _TipoButtonState extends State<TipoButton> {
  var valorTipo;
  _TipoButtonState(this.valorTipo);
  bool selectedConvidado = true;
  bool selectedPrestador = false;

  @override
  Widget build(BuildContext context) {
    valorTipo.text = 'CONVIDADO';

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      valorTipo.text = 'CONVIDADO';
                      selectedConvidado = !selectedConvidado;
                      selectedPrestador = !selectedPrestador;
                    });
                    print(valorTipo.text);
                  },
                  icon: Icon(selectedConvidado
                      ? Icons.check_box
                      : Icons.check_box_outline_blank)),
              Text('Convidado')
            ]),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      valorTipo.text = 'PRESTADOR';
                      selectedConvidado = !selectedConvidado;
                      selectedPrestador = !selectedPrestador;
                    });
                    print(valorTipo.text);
                  },
                  icon: Icon(selectedPrestador
                      ? Icons.check_box
                      : Icons.check_box_outline_blank)),
              Text('Prestador de Serviço')
            ]),
          )
        ]),
      ),
    );
  }
}
