import 'package:flutter/material.dart';

class FormatarDateTime {
  String formatarData(DateTime data) {
    String day = data.day.toString();
    String month = data.month.toString();
    if (day.length != 2) {
      day = '0$day';
    }
    if (month.length != 2) {
      month = '0$month';
    }
    String dataFormatada = '$day/$month/${data.year.toString()}';

    return dataFormatada;
  }

  String formatarHora(String hora, String minuto) {
    if (hora.length != 2) {
      hora = '0$hora';
    }
    if (minuto.length != 2) {
      minuto = '0$minuto';
    }
    String dataFormatada = '$hora:$minuto';

    return dataFormatada;
  }

  String formatarHoras(String hora1, String hora2) {
    var lista = hora1.split(':');
    var lista2 = hora2.split(':');
    return '${lista[0]}:${lista[1]}-${lista2[0]}:${lista2[1]}';
  }

  DateTime toDate(String data) {
    var lista = data.split('/');
    var date = DateTime(
      int.parse(lista[2]),
      int.parse(lista[1]),
      int.parse(lista[0]),
    );

    return date;
  }

   TimeOfDay toTime(String hora) {
    var lista = hora.split(':');
    var horaTime = TimeOfDay(
      hour: int.parse(lista[0]),
      minute: int.parse(lista[1]),
    );

    return horaTime;
  }
}
