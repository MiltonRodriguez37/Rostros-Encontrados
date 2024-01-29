import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin { //Permite usar duracion
  @override

  void initState() { //Inicia cuando se carga esta pantalla
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); //Quita las barras de arriba y abajo

    Future.delayed(Duration(seconds: 3), () { //Cuanto dura la pantalla
      /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(), //A que pagina te manda
        ),
      ); 
      */
    });
  
  
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
    overlays: SystemUiOverlay.values); //Controlamos manualmente el regreso de las barras, aparecen al dejar la pantalla
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity, //La caja cubre toda la pantalla
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 253, 229, 8)],
          ),
        ),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.loop, //Icono
              size: 80,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              'Buscando coincidencias...',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
Descomentar el codigo que redirige a la pagina
https://www.youtube.com/watch?v=baa0SlEDimk
*/