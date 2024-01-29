import 'package:flutter/material.dart';


class RegistrarUsuario extends StatelessWidget {
  const RegistrarUsuario({super.key});

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
  final TextEditingController _contrasenaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: cuerpo()
      
    );
  }


Widget cuerpo(){
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
          width: 275,
            height: 525,
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
              const SizedBox(height: 10),
              campoApellidos(),
              const SizedBox(height: 10),
              campoCorreo(),
              const SizedBox(height: 10),
              campoContrasena(),
              const SizedBox(height: 10),
              campoRepContrasena(),
              const SizedBox(height: 10),              
              campoNumCelular(),
              //campoNumTelefono(),
              const SizedBox(height: 20),
              botonRegistrarse(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ),
  ));

}

Widget nombre(){
  return const Text("REGISTRO DE USUARIO", style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Container campoNombre(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
        hintText: "Nombre",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa tu nombre';
        }  else if(! _esNombreApellidoValido(value ?? "")){
          return 'Solo letras y al menos 2 caracteres';
        }
        return null;
      },
    )
  );
}

Container campoApellidos(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
         //contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: "Apellidos",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa tu apellido';
        } else if(! _esNombreApellidoValido(value ?? "")){
          return 'Solo letras y al menos 2 caracteres';
        }
        return null;
      },
      //style: TextStyle(fontSize: 20),
    ),
  );
}

bool _esNombreApellidoValido(String nombre){
  final RegExp regex = RegExp(r'^[a-zA-Z ]{2,}$');
  return regex.hasMatch(nombre);
}

Widget campoCorreo(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
        hintText: "Correo electrónico",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa tu correo';
        } else if(! _esCorreoValido(value ?? "")){
          return 'Ingresa un correo válido';
        }
        return null;
      },
    ),
  );
}

bool _esCorreoValido(String correo){
  final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return regex.hasMatch(correo);
}

Widget campoContrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      controller: _contrasenaController,
      style: const TextStyle(fontSize: 16),
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value) => _obtenerMensajeErrorContrasena(value ?? ""),
    ),
  );
}

String? _obtenerMensajeErrorContrasena(String contrasena) {
  // Validar la longitud mínima
  if (contrasena.length < 8) {
    return 'Debe tener al menos 8 caracteres.';
  }

  // Validar si contiene al menos una letra mayúscula
  if (!contrasena.contains(RegExp(r'[A-Z]'))) {
    return 'Debe tener una letra mayúscula.';
  }

  // Validar si contiene al menos una letra minúscula
  if (!contrasena.contains(RegExp(r'[a-z]'))) {
    return 'Debe tener una letra minúscula.';
  }

  // Validar si contiene al menos un dígito
  if (!contrasena.contains(RegExp(r'[0-9]'))) {
    return 'Debe contener al menos un dígito.';
  }

  // La contraseña cumple con todos los criterios de validación
  return null;
}

Widget campoRepContrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      style: const TextStyle(fontSize: 16),
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Repite la contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, repite tu contraseña';
        } else if(value != _contrasenaController.text){
          return 'Las contraseñas no coinciden';
        }
        return null;
      },

    ),
  );
}



Widget campoNumCelular(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      decoration: const InputDecoration(
        hintText: "Número de celular",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorMaxLines: 2,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa tu número';
        } else if(!_esNumCelularValido(value ?? "")){
          return 'Longitud de 10, solo números';
        }
        return null;
      },
    ),
  );
}

  bool _esNumCelularValido(String numCelular) {
    final RegExp regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(numCelular);
  }

Widget campoNumTelefono(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: const TextField(
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
        backgroundColor: const Color.fromARGB(255, 253, 229, 8),
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: const EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){
        if(_formKey.currentState?.validate() ?? false){
          //Añadir a base de datos
        }
      }, 
      child: const Text("Registrarse", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ),
  );
}
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