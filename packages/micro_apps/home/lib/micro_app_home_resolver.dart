import 'package:micro_core/micro_core.dart';

import 'app/features/home/presentation/ui/pages/navigator/navigator_screen.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  void Function() get injetionRegister => (){};

  @override
  String get microAppName => "micro_app_home";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/home': (_, __)=> const NavigatorScreen()
  };
}
