import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'package:rostros_encontrados/presentation/screens/start_page.dart';
import 'package:rostros_encontrados/presentation/screens/ingreso.dart';

class AjustesUsuario extends StatelessWidget {
  const AjustesUsuario({Key? key});

  @override
  Widget build(BuildContext context) {
    // Obtener el usuario actual utilizando Provider
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Ingreso()),
            );
          },
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Container(
          height: 500.0,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 250, 249, 249),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Detalles del usuario:",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Nombre: ${user.nombre}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Correo electrónico: ${user.correo}",
                style: const TextStyle(fontSize: 20),
              ),
              // Agrega más detalles del usuario según tus necesidades
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                width: 300,
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {},
                  label: const Text(
                    "Modificar información",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 137, 205),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                width: 300,
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StartPage()),
                    );
                  },
                  label: const Text(
                    "Cerrar sesión",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 8, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}