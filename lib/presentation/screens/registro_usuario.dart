import 'package:flutter/material.dart';


class RegistrarUsuario extends StatelessWidget {
  const RegistrarUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: cuerpo()
      
    );
  }
}

Widget cuerpo(){
  return Container (
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'), //Imagen de fondo
      fit: BoxFit.cover
      
      ) 
    ),
    
  
    child: Center(
      child: Padding (
        padding: const EdgeInsets.only(top: 80.0),
        child: Container (
          width: 275,
            height: 425,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
            children: <Widget>[
              nombre(),
              SizedBox(height: 20,),
              campoNombre(),
              campoApellidos(),
              campoCorreo(),
              campoContrasena(),
              campoRepContrasena(),
              campoNumCelular(),
              //campoNumTelefono(),
              SizedBox(height: 20,),
              botonRegistrarse()
            ],
          ),
        ),
      ),
    ),
  );

}

Widget nombre(){
  return Text("REGISTRO DE USUARIO", style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoNombre(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
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
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
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

Widget campoCorreo(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
      decoration: InputDecoration(
        hintText: "Correo electrónico",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoContrasena(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoRepContrasena(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Repite la contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoNumCelular(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
      decoration: InputDecoration(
        hintText: "Número de celular",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}

Widget campoNumTelefono(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextField(
      decoration: InputDecoration(
        hintText: "Número de teléfono fijo",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}


Widget botonRegistrarse(){

  return SizedBox(
    width: 170,
    height: 60,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 253, 229, 8),
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){}, 
      child: Text("Registrarse", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}

/* 
Widget campoNombre(){
  return Container(
    width: 215,
    height: 55,
    child: TextField(
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
    width: 200,
    height: 80,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Apellidos",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}
*/