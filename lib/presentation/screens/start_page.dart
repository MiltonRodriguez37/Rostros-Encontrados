import 'package:flutter/material.dart';
import 'package:rostros_encontrados/palatte.dart';
import 'package:rostros_encontrados/presentation/screens/inicio_sesion.dart';
import 'package:rostros_encontrados/presentation/screens/registro_usuario.dart'; // Importa el archivo que contiene la pantalla de registro

class StartPage extends StatelessWidget {
  const StartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondoGDL.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 45),
                const Center(
                  child: Column(
                    children: [
                      Text('ROSTROS', style: pLogo),
                      Text('ENCONTRADOS', style: pLogo),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 430,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                      padding: const EdgeInsets.all(13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InicioSesion()),
                      );
                    },
                    child: const Text("     Iniciar sesión     ", style: TextStyle(fontSize: 17, color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrarUsuario()), // Reemplaza con la pantalla de registro que tienes
                      );
                    },
                    child: const Text(
                      '¿No tienes una cuenta? Regístrate aquí',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

