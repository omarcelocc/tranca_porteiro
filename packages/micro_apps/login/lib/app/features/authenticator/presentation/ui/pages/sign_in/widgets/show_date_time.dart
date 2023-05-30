import 'package:flutter/material.dart';

import '../../../../../services/validators/formatar_datetime.dart';

class ShowDateTime extends StatefulWidget {
  ShowDateTime({super.key, required this.data});
  var data;
  @override
  State<ShowDateTime> createState() => _ShowDateTimeState();
}

class _ShowDateTimeState extends State<ShowDateTime> {
  Theme tema(child) {
    return Theme(
      child: child!,
      data: ThemeData().copyWith(
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Theme.of(context).primaryColorLight,
              onPrimary: Theme.of(context).primaryColor,
              secondary: Theme.of(context).primaryColor,
              onSecondary: Theme.of(context).primaryColor,
              error: Theme.of(context).errorColor,
              onError: Theme.of(context).primaryColor,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Theme.of(context).primaryColor)),
    );
  }

  DateTime? date = DateTime.now();
  DateTime initialDate = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);
  DateTime lastDate = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);
  DateTime firstDate = DateTime(
      DateTime.now().year - 120, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    widget.data.text = FormatarDateTime().formatarData(initialDate);
    //double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Data de Nascimento: ',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          InkWell(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                    //locale: const Locale("br","BR"),
                    initialDatePickerMode: DatePickerMode.year,
                    initialEntryMode: DatePickerEntryMode.input,
                    builder: (context, child) => tema(child),
                    initialDate: initialDate,
                    context: context,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    cancelText: 'Cancelar',
                    helpText: 'Data de Nascimento',
                    confirmText: 'OK',
                    errorInvalidText: 'É necessário ter 18 anos ou mais!',
                    fieldHintText: 'DD/MM/AAAA',
                    fieldLabelText: 'Data:',
                    errorFormatText: 'Digite uma data válida',
                    keyboardType: TextInputType.datetime);

                setState(() {
                  date = newDate == null ? date : newDate;
                  initialDate = date!;
                });
                print(widget.data.text);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.date_range),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    //color: Theme.of(context).primaryColor,
                    child: Center(
                        child: Text(
                      '${widget.data.text}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        //decoration: TextDecoration.underline
                      ),
                    )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
