// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:home/app/features/home/presentation/ui/widgets/logout_button.dart';

class ProfileInfor extends StatefulWidget {
  Map userInfo;
  ProfileInfor({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<ProfileInfor> createState() => _ProfileInforState();
}

class _ProfileInforState extends State<ProfileInfor> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                      leading: Icon(Icons.person_pin_circle),
                      title: Text("Apartamento"),
                      subtitle: Text(widget.userInfo['ap']),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_sharp),
                      title: Text("Nome Completo"),
                      subtitle: Text(
                          "${widget.userInfo['firstName']} ${widget.userInfo['lastName']}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("E-mail"),
                      subtitle: Text(widget.userInfo['email']),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Telefone"),
                      subtitle: Text(widget.userInfo['telefone']),
                    ),
                    Visibility(
                      visible: show,
                      child: ListTile(
                        leading: Icon(Icons.person_pin),
                        title: Text("Data de Nascimento"),
                        subtitle: Text(widget.userInfo['data']),
                      ),
                    ),
                    Visibility(
                      visible: show,
                      child: ListTile(
                        leading: Icon(Icons.recent_actors),
                        title: Text("CPF"),
                        subtitle: Text(widget.userInfo['cpf']),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: 
                      
                      Text(
                        show?'Ver menos': 'Ver mais...',
                        style: TextStyle(
                          fontWeight: FontWeight.w500 ,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
