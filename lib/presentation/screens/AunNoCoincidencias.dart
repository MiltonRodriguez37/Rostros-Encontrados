import 'package:flutter/material.dart';

class AunNoCoincidencias extends StatelessWidget {
  const AunNoCoincidencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow, // Fondo amarillo
      body: Center(
        child: Container(
          width: 300,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mensaje de no coincidencias
              Text(
                "No se encontraron coincidencias :(",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 25),
              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  // Botón "Volver"
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar "Volver"
                      // Aquí puedes agregar la lógica para volver atrás
                      Navigator.pop(context); // Cierra esta pantalla
                    },
                    child: Text("Volver"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
