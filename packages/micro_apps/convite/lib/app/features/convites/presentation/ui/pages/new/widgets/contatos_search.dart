// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:convite/app/features/convites/controllers/contato_controller.dart';
import 'package:convite/app/features/convites/models/contato_model.dart';
import 'package:convite/app/features/convites/services/requests/contatos_services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class ContatosSearch extends StatefulWidget {
  var formContato;
  var valorContato;
  var valorName;
  var valorDoc;
  List<ContatoModel> allContatosUser;

  ContatosSearch({
    Key? key,
    required this.allContatosUser,
    required this.formContato,
    required this.valorContato,
    required this.valorName,
    required this.valorDoc,
  }) : super(key: key);

  @override
  State<ContatosSearch> createState() =>
      _ContatosSearchState(formContato, valorContato, valorName, valorDoc, allContatosUser);
}

class _ContatosSearchState extends State<ContatosSearch> {
  var formContato;
  var valorContato;
  var valorName;
  var valorDoc;
  List<ContatoModel> allContatosUser;
  _ContatosSearchState(
      this.formContato, this.valorContato, this.valorName, this.valorDoc, this.allContatosUser);
  @override
  void initState() {
    super.initState();
  }

  String selected = 'Selecione';
  @override
  Widget build(BuildContext context) {
    List<String> myItems = [];
    for (var contato in allContatosUser) {
      myItems.add(contato.nome);
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownSearch<String>(
        key: formContato,
        items: myItems,
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            icon: Icon(Icons.contacts),
            //prefixIcon: Icon(Icons.contacts),
            labelText: 'Meus Contatos',
          ),
        ),
        selectedItem: selected,
        onChanged: ((value) {
          print(value);
        }),
        popupProps: PopupProps.menu(
          menuProps: MenuProps(
              backgroundColor: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20)
              //barrierColor: Colors.white
              ),
          //listViewProps: ListViewProps(),
          scrollbarProps: ScrollbarProps(
            thumbColor: Theme.of(context).highlightColor,
            trackColor: Theme.of(context).highlightColor,
            trackBorderColor: Theme.of(context).highlightColor,
          ),
          showSearchBox: true,
          showSelectedItems: true,
          interceptCallBacks: true,
          itemBuilder: (ctx, item, isSelected) {
            return ListTile(
              selected: isSelected,
              title: Text(item),
              onTap: () {
                formContato.currentState?.popupValidate([item]);
                if (item != 'Selecione') {
                  setState(() {
                    print(item);
                    selected = item;
                    valorName.text = selected;
                    int index = myItems.indexOf(valorName.text);
                    valorDoc.text = allContatosUser[index].documento;
                  });
                } else {
                  setState(() {
                    selected = item;
                    valorContato.clear();
                    valorName.clear();
                    valorDoc.clear();
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
