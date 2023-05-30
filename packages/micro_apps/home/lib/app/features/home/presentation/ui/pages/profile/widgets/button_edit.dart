// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonEdit extends StatefulWidget {
  Function function;
  ButtonEdit({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  State<ButtonEdit> createState() => _ButtonEditState();
}

class _ButtonEditState extends State<ButtonEdit> {
  bool tapped = true;
  _ButtonEditState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (tapped) {
          setState(() {
            tapped = false;
          });
          widget.function;
        } else {}
      },
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 40,
          width: tapped ? 40 : 80,
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
              image: DecorationImage(
                image: AssetImage('images/black.png'),
                opacity: 0.05,
                fit: BoxFit.cover,
              )),
          child: Center(
            child: Container(
              height: 100,
              width: 230,
              child: Center(
                  child: tapped
                      ? Icon(
                          Icons.edit,
                          color: Theme.of(context).focusColor,
                        )
                      : Text(
                          'Salvar',
                          style: TextStyle(
                            color: Theme.of(context).focusColor,
                          ),
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
