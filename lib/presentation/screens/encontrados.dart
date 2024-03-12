import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';

class Encontrados extends StatelessWidget {
  final User? usuario;
  const Encontrados({Key? key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Encontrados no reconocidos",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
