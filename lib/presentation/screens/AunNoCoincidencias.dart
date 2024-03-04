import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
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
      image: DecorationImage(image: NetworkImage("https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg"), //iMAGEN DE FONDO
      fit: BoxFit.cover
      
      ) 
    ),
    
  
    child: Center(
      child: Container (
        width: 300,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
          children: <Widget>[
            mensaje(),
            SizedBox(height: 25,),
            botonTerminar(),
            SizedBox(height: 15,),
            botonRegresar(),
          ],
        ),
      ),
    ),
  );

}


Widget mensaje(){
  return Text("No se encontraron coincidencias. ¿Desea terminar el registro?", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 17.0),);
}


Widget botonTerminar(){

  return SizedBox(
    width: 170,
    height: 50,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 253, 229, 8),
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){}, 
      child: Text("Terminar", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}

Widget botonRegresar(){

  return SizedBox(
    width: 120,
    height: 50,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){}, 
      child: Text("Volver", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}
//ctrl + espacio, ver opciones

