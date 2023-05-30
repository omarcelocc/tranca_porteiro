// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:convite/app/features/convites/services/validators/formatar_datetime.dart';
import 'package:flutter/material.dart';

class ShowDateTime extends StatefulWidget {
  var valorData;
  var valorHoraInicio;
  var valorHoraFim;
  ShowDateTime({
    Key? key,
    required this.valorData,
    required this.valorHoraInicio,
    required this.valorHoraFim,
  }) : super(key: key);

  @override
  State<ShowDateTime> createState() =>
      _ShowDateTimeState(valorData, valorHoraInicio, valorHoraFim);
}

class _ShowDateTimeState extends State<ShowDateTime> {
  var valorData;
  var valorHoraInicio;
  var valorHoraFim;
  _ShowDateTimeState(this.valorData, this.valorHoraInicio, this.valorHoraFim);
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

  TimeOfDay? horaInicial = TimeOfDay.now();
  DateTime? date = DateTime.now();
  TimeOfDay? horaFinal =
      TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);

  @override
  Widget build(BuildContext context) {
    valorHoraInicio.text = FormatarDateTime().formatarHora(
        horaInicial!.hour.toString(), horaInicial!.minute.toString());

    valorHoraFim.text = FormatarDateTime()
        .formatarHora(horaFinal!.hour.toString(), horaFinal!.minute.toString());
    valorData.text = FormatarDateTime().formatarData(date!);

    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Data de entrada:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime initialDate = DateTime.now();
                    DateTime lastDate =
                        DateTime(initialDate.year, initialDate.month + 2);
                    DateTime? newDate = await showDatePicker(
                        builder: (context, child) => tema(child),
                        initialDate: initialDate,
                        context: context,
                        firstDate: initialDate,
                        lastDate: lastDate);
                    setState(() {
                      if (newDate != null) {
                        date = newDate;
                        if (newDate.day == DateTime.now().day &&
                            newDate.month == DateTime.now().month) {
                          print('data hoje');
                          //se a hora inicial for menor que a hora atual ela será atualizada para a hora atual

                          if (horaInicial!.hour < TimeOfDay.now().hour &&
                              horaInicial!.minute <= TimeOfDay.now().minute) {
                            print('hora inicial é menor que a atual');
                            horaInicial = TimeOfDay.now();
                            horaFinal = TimeOfDay(
                                hour: horaInicial!.hour + 1,
                                minute: horaInicial!.minute);
                          }
                        }
                      }
                    });
                  },
                  child: SizedBox(
                    width: width * 0.33,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.date_range),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          //color: Theme.of(context).primaryColor,
                          child: Center(child: Text(valorData.text)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Column(
            children: [
              const Text(
                'Hora de entrada:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? newTimeInicial = await showTimePicker(
                        hourLabelText: 'Hora',
                        minuteLabelText: 'Minuto',
                        helpText: 'Hora de entrada',
                        builder: (context, child) => tema(child),
                        cancelText: 'Cancelar',
                        confirmText: 'OK',
                        context: context,
                        initialTime: horaInicial!);
                    setState(() {
                      //se a date selecionada for hoje
                      if (date!.day == DateTime.now().day &&
                          date!.month == DateTime.now().month) {
                        print('data hoje');
                        //se a hora inicial for menor que a hora atual ela será atualizada para a hora atual
                        if (horaInicial!.hour < TimeOfDay.now().hour &&
                            horaInicial!.minute < TimeOfDay.now().minute) {
                          print('hora inicial é menor que a atual');
                          horaInicial = TimeOfDay.now();
                        }
                        //se a nova data não for nula
                        if (newTimeInicial != null) {
                          print('hora selecionada não é nula');
                          //se a nova hora selecionada for maior ou igual a hora atual
                          if (newTimeInicial.hour >= TimeOfDay.now().hour &&
                              newTimeInicial.minute >= TimeOfDay.now().minute) {
                            print('hora selecionada é maior que a hora atual');
                            horaInicial = newTimeInicial;
                          } else {
                            horaInicial = TimeOfDay.now();
                          }
                        }
                      }
                      //se a data selecionada não for hoje
                      else {
                        print('data não é hoje');
                        //se a nova data não é nula
                        if (newTimeInicial != null) {
                          //se a nova hora selecionada for maior ou igual a hora atual
                          horaInicial = newTimeInicial;
                        }
                      }

                      horaFinal = TimeOfDay(
                          hour: horaInicial!.hour + 1,
                          minute: horaInicial!.minute);
                    });
                    TimeOfDay? newTimeFinal = await showTimePicker(
                        hourLabelText: 'Hora',
                        minuteLabelText: 'Minuto',
                        helpText: 'Hora máxima de entrada',
                        builder: (context, child) => tema(child),
                        cancelText: 'Cancelar',
                        confirmText: 'OK',
                        context: context,
                        initialTime: horaFinal!);
                    setState(() {
                      if (newTimeFinal == null) {
                        horaFinal = horaFinal;
                      } else {
                        if (newTimeFinal.hour <= horaInicial!.hour &&
                            newTimeFinal.minute <= horaInicial!.minute) {
                          horaFinal = horaFinal;
                        } else {
                          horaFinal = newTimeFinal;
                        }
                      }
                    });
                  },
                  child: SizedBox(
                    width: width * 0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.access_time),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          //color: Theme.of(context).primaryColor,
                          child: Center(
                            child: Text(
                                '${valorHoraInicio.text} até ${valorHoraFim.text}'),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
