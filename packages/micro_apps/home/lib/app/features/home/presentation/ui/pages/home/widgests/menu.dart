import 'package:flutter/material.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/widgests/options.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Wrap(
        children: [
          Options(icon: Icons.group_add, text: 'Convites', rota: '/convite',),
          Options(icon: Icons.contact_page, text: 'Contatos',rota: '/contatos'),
          Options(icon: Icons.pool, text: 'Piscina',rota: '/convite'),
          Options(icon: Icons.sports_soccer, text: 'Ginásio',rota: '/convite'),
          Options(icon: Icons.local_drink, text: 'Salão de Festas',rota: '/convite'),
          Options(icon: Icons.outdoor_grill, text: 'Churrasqueiro',rota: '/convite'),
        ],
      ),
      
      );
  }
}
