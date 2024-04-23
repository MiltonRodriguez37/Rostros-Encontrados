import 'package:flutter/material.dart';
class CoincidenciaEncontrada extends StatefulWidget {
  final String idCoincidencia;
  final double porcentajeCoincidencia;

  const CoincidenciaEncontrada({
    required this.idCoincidencia,
    required this.porcentajeCoincidencia,
  });

  @override
  State<CoincidenciaEncontrada> createState() => _CoincidenciaEncontradaState();
}

class _CoincidenciaEncontradaState extends State<CoincidenciaEncontrada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }

  Widget cuerpo() {
    return Container(
      color: Color.fromARGB(255, 253, 229, 8),
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          mensaje1(),
          SizedBox(height: 25),
          mensaje2(),
          SizedBox(height: 50),
          imagenes(),
          SizedBox(height: 15),
          widgetsAbajo(),
          SizedBox(height: 20),
          Text(
            'ID de Coincidencia: ${widget.idCoincidencia}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            'Porcentaje de Coincidencia: ${widget.porcentajeCoincidencia.toStringAsFixed(2)}%',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget mensaje1() {
    return Text(
      "¡Coincidencia encontrada!",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  Widget mensaje2() {
    return Text(
      "La persona a cargo del registro ha sido notificada vía correo electrónico y teléfono.",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 18.0),
    );
  }

  Widget imagenes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg',
              fit: BoxFit.cover,
              width: 125.0,
              height: 175.0,
            ),
            SizedBox(height: 15),
            Text(
              'Foto tomada por ti',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            SizedBox(height: 20),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg',
              fit: BoxFit.cover,
              width: 125.0,
              height: 175.0,
            ),
            SizedBox(height: 15),
            Text(
              'Foto registrada',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  Widget widgetsAbajo() {
    return Text(
      "Widgets abajo.",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }
}