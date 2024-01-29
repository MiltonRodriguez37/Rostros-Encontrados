import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/ingreso.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

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

      body: cuerpo(context)
      
    );
  }


Widget cuerpo(BuildContext context){
  return Container (
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'), //Imagen de fondo
      fit: BoxFit.cover
      
      ) 
    ),
    
  
    child: Form(
      key: _formKey,
      child: Center(
      child: Padding (
        padding: const EdgeInsets.only(top: 80.0),
        child: Container (
          width: 250,
            height: 295,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
            children: <Widget>[
              nombre(),
              const SizedBox(height: 20,),
              campoUsuario(),
              const SizedBox(height: 10,),
              campoContrasena(),
              const SizedBox(height: 20,),
              botonEntrar(context)
            ],
          ),
        ),
      ),
    ),
    )
  );

}

/* 
Widget cuerpo(){
  return Container (
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg"), //iMAGEN DE FONDO
      fit: BoxFit.cover
      
      ) 
    ),
    
  
    child: Center(
      child: Container (
        width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
        children: <Widget>[
          nombre(),
          SizedBox(height: 30,),
          campoUsuario(),
          campoContrasena(),
          SizedBox(height: 30,),
          botonEntrar()
        ],
      ),
    ),
  );

}
*/


Widget nombre(){
  return const Text("INICIO DE SESIÓN", style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoUsuario(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    height: 50,
    child: TextFormField(
      decoration: const InputDecoration(
        hintText: "Correo electrónico",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12),
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Ingresa tu correo';
        }
        return null;
      },
    ),
  );
}

Widget campoContrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    height: 50,
    child: TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Ingresa tu contraseña';
        }
        return null;
      },
    )
  );
}



Widget botonEntrar(BuildContext context){

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
      onPressed: (){
        if(_formKey.currentState?.validate() ?? false){
          //Avanza a la siguiente página
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ingreso()),
          );
        }
      }, 
      child: const Text("Ingresar", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}
//ctrl + espacio, ver opciones
}