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
    color: Color.fromARGB(255, 253, 229, 8),
    child: Column (
        children: <Widget>[
        SizedBox(height: 50,),
        mensaje1(),
        SizedBox(height: 25,),
        mensaje2(),
        SizedBox(height: 50,),
        imagenes(),
        SizedBox(height: 15,),
        widgetsAbajo(),
      ],
    ),
  );
}


Widget mensaje1(){
  return Text("¡Coincidencia encontrada!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20.0),);
}

Widget mensaje2(){
  return Text("La persona a cargo del registro ha sido notificada via correo electrónico y teléfono.", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 18.0),);
}

Widget imagenes(){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg',
            fit: BoxFit.cover,
            width: 125.0,  // Ancho deseado
            height: 175.0, // Altura deseada
          ),
          SizedBox(height: 15),
          Text(
            'Foto tomada por ti',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 17.0),
          ),
          SizedBox(height: 20),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://thumbs.dreamstime.com/b/portrait-innocence-innocent-kid-slum-islamabad-pakistan-67584463.jpg',
            fit: BoxFit.cover,
            width: 125.0,  // Ancho deseado
            height: 175.0, // Altura deseada
          ),
          SizedBox(height: 15),
          Text(
            'Foto registrada',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 17.0),
          ),
          SizedBox(height: 20),
        ],
      ),
    ],
  );
}

Widget widgetsAbajo(){
   return Text("Widgets abajo.", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15.0),);
}
//ctrl + espacio, ver opciones

