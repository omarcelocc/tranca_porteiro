import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:login/app/features/authenticator/controllers/condo_controller.dart';

import '../../../../../models/condo_model.dart';

class CondoSearch extends StatefulWidget {
  List<CondoModel> condos;
  var formCondo;
  var valorCondo;

  CondoSearch({
    super.key,
    required this.condos,
    required this.formCondo,
    required this.valorCondo,
  });

  @override
  State<CondoSearch> createState() => _CondoSearchState();
}

final List<String> myItems = [];
final List<Map<String, dynamic>> condominios = [];

class _CondoSearchState extends State<CondoSearch> {
  String selected = 'Selecione';
  @override
  void initState() {
    widget.condos.forEach((condos) {
      condominios.add({"id": condos.id, "nome": condos.nome});
      myItems.add(condos.nome);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: DropdownSearch<String>(
          key: widget.formCondo,
          items: myItems,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Condominio',
            ),
          ),
          selectedItem: selected,
          onChanged: ((value) {
            print(value);
          }),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            interceptCallBacks: true,
            itemBuilder: (ctx, item, isSelected) {
              return ListTile(
                selected: isSelected,
                title: Text(item),
                onTap: () {
                  widget.formCondo.currentState?.popupValidate([item]);
                  setState(() {
                    print(item);
                    selected = item;
                    widget.condos.forEach((condo) {
                      if (condo.nome == selected) {
                        widget.valorCondo.text = condo.id.toString();
                        print(widget.valorCondo.text);
                      }
                    });
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
