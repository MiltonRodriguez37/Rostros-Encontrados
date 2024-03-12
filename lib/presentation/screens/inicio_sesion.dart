import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/ingreso.dart';
import 'package:rostros_encontrados/presentation/screens/start_page.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rostros_encontrados/presentation/screens/session_provider.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

@override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: Home(),
    );
  }
  
 /*  @override
  Widget build(BuildContext context) {
    return const Home();
  } */
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: cuerpo(context)
      
    );
  }


Widget cuerpo(BuildContext context){
  return Stack(
  children: [
  Container (
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
  ),
    Positioned(
      top: 20, // Ajusta la posición del botón verticalmente según sea necesario
      left: 20, // Ajusta la posición del botón horizontalmente según sea necesario
      child: atras(),
  ),
  ]);

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

Widget atras(){
    return IconButton(onPressed: (){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StartPage()),
    );
    }, iconSize: 40, icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255),), alignment: Alignment.topLeft,);
    }

Widget nombre(){
  return const Text("INICIO DE SESIÓN", style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoUsuario(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    height: 50,
    child: TextFormField(
      controller: _usuarioController,
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
      controller: _contrasenaController,
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
    width: 190,
    height: 45,
    child: TextButton.icon(
    icon: const Icon(Icons.lock_open, color: Color.fromARGB(255, 0, 0, 0),),
    onPressed: (){
      if (_formKey.currentState?.validate() ?? false) {
        // Avanza a la siguiente página
        _enviarDatos();
      }
    },
    label: const Text("Ingresar", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17)),
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 253, 229, 8),
      padding: const EdgeInsets.all(13),
      side: const BorderSide(width: 1, color: Colors.black)
      ),
    ),
   /*  child: TextButton(
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
      
    ), */
  );
}

String encriptarContrasena(String contrasena) {
  // Crea un objeto de hash SHA-256
  var sha256 = crypto.sha256;
  
  // Convierte la contraseña a bytes UTF-8 y calcula su hash
  var bytes = utf8.encode(contrasena);
  var hash = sha256.convert(bytes);
  
  // Retorna el hash en formato hexadecimal
  return hash.toString();
}

void _enviarDatos() async {
  final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/iniciar_sesion');
  final contrasenaEncriptada = encriptarContrasena(_contrasenaController.text);
  // Construye el cuerpo de la solicitud con los datos que deseas enviar
  final body = jsonEncode({
    'usuario': _usuarioController.text,
    'contrasena': contrasenaEncriptada,
    // Agrega más campos según tus necesidades
  });

  // Realiza la solicitud HTTP POST
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  // Verifica el estado de la respuesta
  if (response.statusCode == 200) {
    // La solicitud fue exitosa
    final user = await obtenerDatosUsuario(_usuarioController.text);
    if (user != null) {
      // Obtén una referencia al SessionProvider del contexto actual
      final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
      // Establece el usuario en el SessionProvider
      sessionProvider.setUser(User(
        correo: user['correo'],
        nombre: user['nombre_usuario'],
        apellido: user['apellido_usuario'],
        id: user['id_usuario'],
        telefono: user['telefono'],
      ));
      // El usuario fue encontrado, puedes navegar a la pantalla de Ingreso
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ingreso()),
      );
    } else {
      // Maneja el caso en que no se pueda obtener el usuario
      _mostrarMensajeError(context,'No se encontró al usuario en la Base de Datos');
    }
  } else if(response.statusCode == 401){
    print('Error al enviar datos: ${response.statusCode}');
    _mostrarMensajeError(context,'Contraseña incorrecta');
  } else if(response.statusCode == 404){
    print('Error al enviar datos: ${response.statusCode}');
    _mostrarMensajeError(context,'Usuario no encontrado');
  }
  else {
    // Hubo un error en la solicitud
    print('Error al enviar datos: ${response.statusCode}');
    _mostrarMensajeError(context,'Error en el servidor');

  }
}

void _mostrarMensajeError(BuildContext context,error) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('¡Error!'),
        content: Text(error),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}

Future<Map<String, dynamic>?> obtenerDatosUsuario(String correo) async {
  final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/obtener_usuario?correo=$correo');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // La solicitud fue exitosa
    return json.decode(response.body);
  } else {
    // Hubo un error en la solicitud
    print('Error al obtener datos del usuario: ${response.statusCode}');
    return null;
  }
}
//ctrl + espacio, ver opciones
}