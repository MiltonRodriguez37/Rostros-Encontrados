import 'package:flutter/material.dart';
class CoincidenciaEncontrada extends StatefulWidget {
  //final String idCoincidencia;
  final double porcentajeCoincidencia;
  final Map<String, dynamic> detallesCoincidencia;
  final Map<String, dynamic> detallesUsuario;
  

  const CoincidenciaEncontrada({
    //required this.idCoincidencia,
    required this.porcentajeCoincidencia,
    required this.detallesCoincidencia,
    required this.detallesUsuario,
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
      padding: const EdgeInsets.all(25),
      color: const Color.fromARGB(255, 253, 229, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          mensaje1(),
          const SizedBox(height: 15),
          mensaje2(),
          const SizedBox(height: 10),
          mensaje3(),
          const SizedBox(height: 10),
          mensaje4(),
          const SizedBox(height: 15),
          imagenes(),
          //widgetsAbajo(),
          //SizedBox(height: 20),
          /* Text(
            'ID de Coincidencia: ${widget.idCoincidencia}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ), */
          Text(
            'Porcentaje de Coincidencia: ${widget.porcentajeCoincidencia.toStringAsFixed(2)}%',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Nombre: ${widget.detallesCoincidencia['nombre_persona']} ${widget.detallesCoincidencia['apellido_persona']}',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fecha de nacimiento: ${widget.detallesCoincidencia['fecha_nac']}',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fecha y último lugar donde se vio: ${widget.detallesCoincidencia['fecha_lugar']}',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Características: ${widget.detallesCoincidencia['caracteristicas']}',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Datos adicionales: ${widget.detallesCoincidencia['datos_adicionales']}',
            //textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget mensaje1() {
    return const Text(
      "¡Coincidencia encontrada!",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }

  Widget mensaje2() {
    return const Text(
      "Puedes comunicarte con el usuario que registró a esta persona por medio de su teléfono o su correo electrónico:",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }

    Widget mensaje3() {
    return Text(
      "Teléfono: ${widget.detallesUsuario['telefono']}",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }
    Widget mensaje4() {
    return Text(
      "Correo: ${widget.detallesUsuario['correo']}",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
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
            const SizedBox(height: 15),
            const Text(
              'Foto tomada por ti',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 15),
            const Text(
              'Foto registrada',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  /* Widget widgetsAbajo() {
    return Text(
      "Widgets abajo.",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  } */
}