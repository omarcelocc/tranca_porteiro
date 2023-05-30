// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:home/app/features/home/models/condominio_model.dart';
import 'package:home/app/features/home/presentation/ui/pages/condo/widgets/condo_info.dart';
import 'package:home/app/features/home/presentation/ui/pages/condo/widgets/header_condo.dart';
import 'package:home/app/features/home/services/clients/dio_client.dart';
import 'package:home/app/features/home/services/requests/condominio_service.dart';

class CondoPage extends StatefulWidget {
  CondominioModel condominio;
  CondoPage({
    Key? key,
    required this.condominio,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CondoPageState(condominio);
  }
}

class _CondoPageState extends State<CondoPage> {
  CondominioModel condominio;
  _CondoPageState(this.condominio);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const SizedBox(
                height: 100,
                child: HeaderCondo(100, false),
              ),
              Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/perfilCondo.jpg')),
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20,
                                    offset: Offset(20, 20),
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              condominio.nome,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Seu condominio está seguro',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 4.0),
                                    alignment: Alignment.topLeft,
                                    child: const Text(
                                      "Informações do Condominio",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  CondoInfo(
                                    condominio: condominio,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
            ],
          ),
        ),
      ),
    );
  }
}
