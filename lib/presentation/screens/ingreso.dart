import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/camara.dart';
import 'package:rostros_encontrados/presentation/screens/encontrados.dart';
import 'package:rostros_encontrados/presentation/screens/inicio.dart';
import 'package:rostros_encontrados/presentation/screens/registro_persona.dart';
import 'package:provider/provider.dart';
import 'package:rostros_encontrados/presentation/screens/session_provider.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';

class Ingreso extends StatefulWidget {
  const Ingreso({super.key});

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  // This widget is the root of your application.

  int pagina_actual = 1;
  late User? usuario;

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    usuario = sessionProvider.user;
      final List<Widget> paginas = [Registrar(usuario:usuario), Inicio(usuario: usuario),Camara(usuario: usuario)];
    return Scaffold(
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          ],
        ),
    );
  }
}