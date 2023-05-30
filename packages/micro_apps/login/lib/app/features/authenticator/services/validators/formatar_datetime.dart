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
}
