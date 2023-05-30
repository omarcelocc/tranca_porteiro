import 'package:micro_core/micro_core.dart';

import 'app/features/convites/presentation/ui/pages/navigator/navigator_screen.dart';



class MicroAppConviteResolver implements MicroApp {
  @override
  void Function() get injetionRegister => (){};

  @override
  String get microAppName => "micro_app_convite";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/convite': (_, __)=> NavigatorScreen(index: 2,),
    '/conviteFinalizado': (_, __)=> NavigatorScreen(index: 3,)
  };
}
