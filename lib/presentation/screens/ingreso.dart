import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/camara.dart';
import 'package:rostros_encontrados/presentation/screens/inicio.dart';
import 'package:rostros_encontrados/presentation/screens/registro_persona.dart';


class Ingreso extends StatefulWidget {
  const Ingreso({super.key});

  @override
  State<Ingreso> createState() => _MyAppState();
}

class _MyAppState extends State<Ingreso> {
  // This widget is the root of your application.

  int pagina_actual = 1;

  List<Widget> paginas = [Registrar(), Inicio(), Camara()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rostros Encontrados',
      home: Scaffold(
        body: paginas[pagina_actual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              pagina_actual = index;
            });
          },
          backgroundColor: Color.fromARGB(255, 253, 229, 8),
          currentIndex: pagina_actual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Registra"),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Captura")
          ],
        ),
      ),
    );
  }
}