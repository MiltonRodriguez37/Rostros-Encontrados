import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Inicio extends StatelessWidget {

  List<String> registros = ['Oscar Gutiérrez Pérez','Ian Horcasitas Pérez','Milton Rodriguez González','Dafne Crespo Romo','Alejandra Barajas Ochoa'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio',
      home: cuerpo(),
    );
  }

  Widget cuerpo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Center(
      child: Column (
      children: [
          const SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              const Text("Tus Registros", style: TextStyle(color: Colors.black, fontSize: 30.0, decoration: TextDecoration.none,), textAlign:TextAlign.left), 
              //const SizedBox(width: 60,),
              IconButton(onPressed: () => print("Presionado"), iconSize: 50, icon: const Icon(Icons.person, color: Colors.black,), alignment: Alignment.topRight,)
            ]
          ),
          const SizedBox(height: 40,),
          for (var i=0; i < registros.length; i++) ...[
              registro(registros[i]),
              const SizedBox(height: 20,)
          ],
        ],
      ),
    ),
  );
  }

  Widget registro(texto) {
    return Container(
    width: 1000,
    height: 90,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: const BoxDecoration(color: Color.fromARGB(211, 201, 201, 201), borderRadius: BorderRadius.all(Radius.circular(25))),
    child: Column(
    children: <Widget>[
    Text(texto, style: const TextStyle(color: Colors.black, fontSize: 15.0, decoration: TextDecoration.none,), textAlign:TextAlign.center,),
    const SizedBox(height: 10,),
    boton_registro(),
    ],
    ),
    );
  }

  Widget boton_registro() {
    return SizedBox(
    width: 150,
    height: 40,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 253, 229, 8),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: () => print("Registro"), 
      child: Text("Ver Registro", style: TextStyle(fontSize: 12, color: Colors.black, decoration: TextDecoration.none,),)
      
    ),
  );
  }
}