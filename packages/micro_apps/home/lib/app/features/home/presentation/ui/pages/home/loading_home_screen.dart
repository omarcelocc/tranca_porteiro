import 'package:flutter/material.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/widgests/loading_options.dart';
import 'package:home/app/features/home/presentation/ui/pages/home/widgests/menu.dart';

class LoadingHomeScreen extends StatefulWidget {
  bool dados;
  LoadingHomeScreen({required this.dados, Key? key}) : super(key: key);

  @override
  State<LoadingHomeScreen> createState() => _LoadingHomeScreenState();
}

class _LoadingHomeScreenState extends State<LoadingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListView(children: [
        Column(children: [
          Container(
            width: width,
            height: height * 0.20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight
                  ],
                  begin: const FractionalOffset(0, 0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: height * 0.22,
                      height: height * 0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/tranca.png'),
                              opacity: 0.8)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.015),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () async {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.help, color: Colors.white))
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.055, left: width * 0.04),
                    child: CircularProgressIndicator()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Wrap(
              children: [
                LoadingOptions(dados: widget.dados,),
                LoadingOptions(dados: widget.dados,),
                LoadingOptions(dados: widget.dados,),
                LoadingOptions(dados: widget.dados,),
                LoadingOptions(dados: widget.dados,),
                LoadingOptions(dados: widget.dados,),
              ],
            ),
          )
        ]),
      ]),
    );
  }
}
