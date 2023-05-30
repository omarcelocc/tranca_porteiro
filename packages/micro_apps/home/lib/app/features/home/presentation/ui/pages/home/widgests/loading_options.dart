// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class LoadingOptions extends StatefulWidget {
  bool dados;
  LoadingOptions({
    required this.dados,
    super.key,
  });

  @override
  State<LoadingOptions> createState() => _LoadingOptionsState();
}

class _LoadingOptionsState extends State<LoadingOptions> {
  bool animated = false;

  animacao() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      print(widget.dados);
      try {
        setState(() {
          animated = !animated;
        });
      } catch (e) {
        timer.cancel();
        print(e);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animated = true;
    animacao();
  }

  @override
  void dispose() {
    super.dispose();
    animacao();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      width: width * 0.4,
      height: width * 0.4,
      child: Container(
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
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          width: width * 0.4,
          height: width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: AnimatedOpacity(
                    opacity: animated ? 0.1 : 1.0,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedTheme(
                      duration: Duration(milliseconds: 500),
                      data: ThemeData(
                          primaryColor: animated
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                          primaryColorLight: animated
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)),
                      child: Container(
                        height: width * 0.13,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              animated
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.6),
                              animated
                                  ? Colors.white.withOpacity(0.6)
                                  : Colors.white.withOpacity(0.3),
                            ])),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: AnimatedOpacity(
                    opacity: animated ? 0.1 : 1.0,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedTheme(
                      duration: Duration(milliseconds: 500),
                      data: ThemeData(
                        primaryColor: animated
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white.withOpacity(0.6),
                        primaryColorLight: animated
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white.withOpacity(0.6),
                      ),
                      child: Container(
                        height: width * 0.05,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              animated
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.6),
                              animated
                                  ? Colors.white.withOpacity(0.6)
                                  : Colors.white.withOpacity(0.3),
                            ])),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
