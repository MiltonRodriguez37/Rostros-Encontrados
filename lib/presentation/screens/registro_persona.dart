import 'package:flutter/material.dart';


class Registrar extends StatelessWidget {
  const Registrar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi App",
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: cuerpo()
      
    );
  }
}

Widget cuerpo(){
  return Container (
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'), //Imagen de fondo
      fit: BoxFit.cover
      
      ) 
    ),
    
  
    child: Center(
      child: Padding (
        padding: const EdgeInsets.only(top: 80.0),
        child: Container (
          width: 275,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
            children: <Widget>[
              nombre(),
              const SizedBox(height: 20,),
              campoNombre(),
              campoApellidos(),
              campoFechaNac(),
              campoFechaLugar(),
              campoCaracteristicas(),
              campoDatosAdicionales(),
              const SizedBox(height: 20,),
              botonAdjuntarImagen()
            ],
          ),
        ),
      ),
    ),
  );

}

Widget nombre(){
  return const Text("DATOS DEL DESAPARECIDO/A",  textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoNombre(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Nombre",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoApellidos(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
      decoration: InputDecoration(
         //contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: "Apellidos",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
      //style: TextStyle(fontSize: 20),
    ),
  );
}

Widget campoFechaNac(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Fecha de nacimiento",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoFechaLugar(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Fecha y lugar último avistamiento",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoCaracteristicas(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Características particulares",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoDatosAdicionales(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Datos adicionales",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}


Widget botonAdjuntarImagen(){

  return SizedBox(
    width: 170,
    height: 60,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 253, 229, 8),
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: const EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){}, 
      child: const Text("Adjuntar imagen", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}

//https://mundocursos-online.translate.goog/como-poner-una-imagen-en-flutter/?_x_tr_sl=es&_x_tr_tl=de&_x_tr_hl=de&_x_tr_pto=sc