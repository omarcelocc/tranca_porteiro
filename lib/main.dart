import 'package:contatos/micro_app_contatos_resolver.dart';
import 'package:convite/micro_app_convite_resolver.dart';
import 'package:dependencies/app/base_local_storage/services/banco_local.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login/micro_app_login_resolver.dart';
import 'package:home/micro_app_home_resolver.dart';
import 'package:micro_core/micro_core.dart';
import 'package:provider/provider.dart';

import 'app/splash/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => BancoLocal()
      ),
      ChangeNotifierProvider(
        create: (context) => UsuarioLocal()
      ),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatefulWidget with BaseApp {
  //construtor
  MyApp({Key? key}) : super(key: key) {
    //iniciando os registros de injeções e rotas
    super.registerInjetions();
    super.registerRouters();
  }

  //rota da classe main
  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        '/splash': (_, __) => const SplashScreen(),
      };

  //lista de micro_apps 
  @override
  List<MicroApp> get microApps => [
        MicroAppLoginResolver(),
        MicroAppHomeResolver(),
        MicroAppConviteResolver(),
        MicroAppContatosResolver(),
      ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tema = false;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  //azul1 = '#004a87';
  final Color _indicatorColor = HexColor('#ebe19a');
  //final Color _focusColor = HexColor('#ebe19a');
  final Color _focusColor = HexColor('#38dcfc');

  final Color _primaryColor = HexColor('#004a87');
  final Color _highlightColor = HexColor('#38dcfc');
  final Color _primaryColorLight = HexColor('#2a86d1');
  final Color _primaryColorDark = HexColor('#001B47');

  final Color _errorColor = HexColor('#910101');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData lightMode = ThemeData(
      highlightColor: _highlightColor,
      errorColor: _errorColor,
      focusColor: _focusColor,
      indicatorColor: _indicatorColor,
      primaryColor: _primaryColor,
      primaryColorLight: _primaryColorLight,
      primaryColorDark: _primaryColorDark,
      scaffoldBackgroundColor: Colors.grey.shade100,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue)
          .copyWith(secondary: _primaryColorLight),
    );
    ThemeData darkMode = ThemeData(colorScheme: const ColorScheme.dark());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tranca',
      theme: !tema ? lightMode : darkMode,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.widget.generateRoute,
      initialRoute: '/splash',
    );
  }
}
