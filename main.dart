import 'package:flutter/material.dart';
import 'package:rostros_encontrados/pages/camara.dart';
import 'package:rostros_encontrados/pages/inicio.dart';
import 'package:rostros_encontrados/pages/registrar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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