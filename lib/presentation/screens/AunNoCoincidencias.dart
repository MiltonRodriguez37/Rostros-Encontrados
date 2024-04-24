import 'package:flutter/material.dart';

class AunNoCoincidencias extends StatelessWidget {
  const AunNoCoincidencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de la pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido centrado en la pantalla
          Center(
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
                    "No se encontraron coincidencias.\n¿Desea terminar el registro?",
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
                      // Botón "Terminar"
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar "Terminar"
                          // Aquí puedes agregar la lógica para terminar el registro
                          Navigator.pop(context); // Cierra esta pantalla
                        },
                        child: Text("Terminar"),
                      ),
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
        ],
      ),
    );
  }
}
