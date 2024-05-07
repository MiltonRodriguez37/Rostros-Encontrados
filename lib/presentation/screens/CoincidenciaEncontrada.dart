import 'package:flutter/material.dart';
class CoincidenciaEncontrada extends StatefulWidget {
  //final String idCoincidencia;
  final double porcentajeCoincidencia;
  final Map<String, dynamic> detallesCoincidencia;
  final Map<String, dynamic> detallesUsuario;
  final Image desaparecido;
  final Image encontrado;
  

  const CoincidenciaEncontrada({
    //required this.idCoincidencia,
    required this.porcentajeCoincidencia,
    required this.detallesCoincidencia,
    required this.detallesUsuario,
    required this.desaparecido,
    required this.encontrado
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
    color: const Color.fromARGB(255, 253, 229, 8),
    child: Container(
      margin: EdgeInsets.all(10), // Ajusta los márgenes interiores según sea necesario
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ajusta el alineamiento de los hijos para expandirse verticalmente
        children: <Widget>[
          SizedBox(height: 25), // Espacio antes de todo el contenido
          Expanded( // Utiliza Expanded en lugar de Flexible
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // Ajusta el radio de los bordes según sea necesario
                border: Border.all(color: Colors.white, width: 15), // Agrega un borde alrededor del contenedor blanco
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    botonRegresar(),
                    SizedBox(height: 3),
                    mensajeTitulo(),
                    SizedBox(height: 3),
                    mensajeNombre(),
                    SizedBox(height: 3),
                    mensajePorcentaje(),
                    SizedBox(height: 20),
                    imagenes(),
                    mensaje2(),
                    SizedBox(height: 5),
                    mensaje3(),
                    SizedBox(height: 5),
                    mensaje4(),
                    SizedBox(height: 20),
                    mensajeSubtitulo(),
                    SizedBox(height: 7),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        children: [
                          TextSpan(
                            text: 'Fecha de nacimiento: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${widget.detallesCoincidencia['fecha_nac']}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        children: [
                          TextSpan(
                            text: 'Fecha y lugar donde se vió por última vez: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${widget.detallesCoincidencia['fecha_lugar']}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        children: [
                          TextSpan(
                            text: 'Características: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${widget.detallesCoincidencia['caracteristicas']}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        children: [
                          TextSpan(
                            text: 'Datos adicionales: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${widget.detallesCoincidencia['datos_adicionales']}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



  Widget mensajeTitulo() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "¡Coincidencia encontrada!",
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget mensaje2() {
    return const Text(
      "Puedes contactar al usuario que registró a esta persona a través de:",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }

  Widget mensaje3() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 15.0, ),
        children: [
          TextSpan(
            text: 'Teléfono: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: widget.detallesUsuario['telefono'],
          ),
        ],
      ),
    );
  }

   Widget mensaje4() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 15.0),
        children: [
          TextSpan(
            text: 'Correo: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: widget.detallesUsuario['correo'],
          ),
        ],
      ),
    );
  }

  Widget mensajePorcentaje() {
    return Center(
      child: Text(
        'Similitud: ${widget.porcentajeCoincidencia.toStringAsFixed(2)}%',
        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget mensajeNombre() {
    return Center(
      child: Text(
        '${widget.detallesCoincidencia['nombre_persona']} ${widget.detallesCoincidencia['apellido_persona']}',
        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget mensajeSubtitulo() {
    return Center(
      child: Text(
        'Información adicional',
        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  

Widget imagenes() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150.0, // Ancho máximo del contenedor
            height: 175.0,
            child: widget.encontrado,
          ),
          const SizedBox(height: 15),
          const Text(
            'Foto tomada por ti',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150.0, // Ancho máximo del contenedor
            height: 175.0,
            child: widget.desaparecido,
          ),
          const SizedBox(height: 15),
          const Text(
            'Foto registrada',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ],
  );
}





  

  Widget botonRegresar() {
    return Padding(
      padding: EdgeInsets.only(left: 0.0), // Ajusta el valor según sea necesario
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 48, 48, 48)),
        onPressed: () {
          Navigator.pop(context); 
        },
        iconSize: 30,
        color: Color.fromARGB(255, 224, 8, 8),
      ),
    );
  }


}
