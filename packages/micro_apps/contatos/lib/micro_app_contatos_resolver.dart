import 'package:contatos/app/features/contatos/presentation/ui/pages/contatos/contatos_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppContatosResolver implements MicroApp {
  @override
  void Function() get injetionRegister => (){};

  @override
  String get microAppName => "micro_app_contatos";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/contatos': (_, __)=>  ContatosPage()
  };
}
