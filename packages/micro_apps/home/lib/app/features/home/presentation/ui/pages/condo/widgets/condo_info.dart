import 'package:flutter/material.dart';
import 'package:home/app/features/home/models/condominio_model.dart';

class CondoInfo extends StatefulWidget {
  CondominioModel condominio;
  CondoInfo({required this.condominio, super.key});

  @override
  State<CondoInfo> createState() => _CondoInfoState(condominio);
}

class _CondoInfoState extends State<CondoInfo> {
  CondominioModel condominio;
  _CondoInfoState(this.condominio);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                ...ListTile.divideTiles(
                  color: Colors.grey,
                  tiles: [
                     ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      leading: Icon(Icons.local_activity),
                      title: Text("Localização"),
                      subtitle: Text(condominio.endereco),
                    ),
                    ListTile(
                      leading: Icon(Icons.dock),
                      title: Text("Cnpj"),
                      subtitle: Text(condominio.cnpj),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Contato"),
                      subtitle: Text(condominio.telefone),
                    ),
                    ListTile(
                      leading: Icon(Icons.description),
                      title: Text("Descrição"),
                      subtitle: Text(condominio.descricao),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
