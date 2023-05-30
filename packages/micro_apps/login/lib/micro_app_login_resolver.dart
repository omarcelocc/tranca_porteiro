import 'package:login/app/features/authenticator/presentation/ui/pages/login/login_screen.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  void Function() get injetionRegister => (){};
  
  @override
  String get microAppName => "micro_app_login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/login': (_, __)=> const LoginScreen()
  };
}
