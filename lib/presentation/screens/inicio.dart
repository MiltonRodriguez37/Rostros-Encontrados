import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/ajustes_usuario.dart';

class Inicio extends StatelessWidget {
  final List<String> registros = ['Oscar Gutiérrez Pérez', 'Ian Horcasitas Pérez', 'Milton Rodriguez González'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Tus Registros",
                  style: TextStyle(color: Colors.black, fontSize: 30.0, decoration: TextDecoration.none,),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AjustesUsuario()),
                    );
                  },
                  iconSize: 50,
                  icon: const Icon(Icons.person, color: Colors.black,),
                  alignment: Alignment.topRight,
                )
              ],
            ),
            const SizedBox(height: 40,),
            for (var i=0; i < registros.length; i++) ...[
              registro(registros[i], context),
              const SizedBox(height: 20,)
            ],
          ],
        ),
      ),
    );
  }

  Widget registro(texto, BuildContext context) {
    return Container(
      width: 1000,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(color: Color.fromARGB(211, 201, 201, 201), borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        children: <Widget>[
          Text(
            texto,
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none,),
            textAlign:TextAlign.center,
          ),
          const SizedBox(height: 10,),
          boton_registro(context),
        ],
      ),
    );
  }

  Widget boton_registro(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: TextButton.icon(
        icon: const Icon(Icons.visibility, color: Color.fromARGB(255, 0, 0, 0),),
        onPressed: () => print("Registro"),
        label: const Text("Ver Registro", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17, decoration: TextDecoration.none,)),
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 253, 229, 8),
          padding: const EdgeInsets.all(13),
          side: const BorderSide(width: 1, color: Colors.black)
        ),
      ),
    );
  }
}