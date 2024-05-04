import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/ajustes_usuario.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'dart:convert';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'package:rostros_encontrados/presentation/screens/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:rostros_encontrados/presentation/screens/inicio_sesion.dart';


class ModificarUsuario extends StatelessWidget {
  final User? usuario;
  const ModificarUsuario({Key? key, required this.usuario}) : super(key:key);

/*   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: Home(),
    );
  } */
  @override
  Widget build(BuildContext context) {
    return Home(usuario: usuario,);
  }
}


class Home extends StatefulWidget {
  final User? usuario; // Agregar usuario como un parámetro

  const Home({Key? key, required this.usuario}) : super(key: key);
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(widget.usuario)
      
    );
  }

  @override
  void initState() {
    super.initState();
    // Establece el valor inicial en el controlador
    _nombreController.text = widget.usuario?.nombre ?? '';
    _apellidosController.text = widget.usuario?.apellido ?? '';
    _correoController.text = widget.usuario?.correo ?? '';
    _celularController.text = widget.usuario?.telefono ?? '';
  }


Widget cuerpo(User? usuario){
  return Stack (
  children: [
  Container (
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'), //Imagen de fondo
      fit: BoxFit.cover
      ) 
    ),
    
  child: SingleChildScrollView(
    child: Form(
    key: _formKey,
    child: Center(
      child: Padding (
        padding: const EdgeInsets.only(top: 120.0,bottom:230.0),
        child: Container (
          width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center, //Teniendo la columna, se debe centrar dentro de la columna
            children: <Widget>[
              const SizedBox(height: 20,),
              nombre(),
              const SizedBox(height: 20,),
              info(),
              const SizedBox(height: 20,),
              campoNombre(usuario),
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
              botonModificar(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  )
  )
  
  ),
  Positioned(
    top: 20, // Ajusta la posición del botón verticalmente según sea necesario
    left: 20, // Ajusta la posición del botón horizontalmente según sea necesario
    child: atras(),
  ),
  ]);

}


Widget atras(){
    return IconButton(onPressed: (){
      final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
      final user = sessionProvider.user;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AjustesUsuario(user: user)),
    );
    }, iconSize: 40, icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255),), alignment: Alignment.topLeft,);
    }

Widget nombre(){
  return const Text("MODIFICAR DATOS DE USUARIO", style: TextStyle(color: Colors.black, fontSize: 20.0),);
}

Widget info() {
  return Center(
    child: Text(
      "Puede mantener su contraseña o actualizarla al ingresar una nueva", 
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      textAlign: TextAlign.center, // Asegura que el texto esté centrado
    ),
  );
}

Container campoNombre(User? usuario){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      controller: _nombreController,
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
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
      controller: _apellidosController,
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
  final RegExp regex = RegExp(r'^[a-zA-ZÍÚÉÁÓíúéáóñÑÄÜÖËÏäëïöü ]{2,}$');
  return regex.hasMatch(nombre);
}

Widget campoCorreo(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      controller: _correoController,
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
  final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-zA-Z]{2,})$');
  return regex.hasMatch(correo);
}

bool _obscureText = true;
bool _obscureText2 = true;

Widget _visibilidadContrasena() {
  return IconButton(
    icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
    onPressed: () {
      setState(() {
        _obscureText = !_obscureText;
      });
    },
  );
}
Widget _visibilidadRepContrasena() {
  return IconButton(
    icon: _obscureText2 ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
    onPressed: () {
      setState(() {
        _obscureText2 = !_obscureText2;
      });
    },
  );
}
Widget campoContrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
      controller: _contrasenaController,
      style: const TextStyle(fontSize: 16),
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorMaxLines: 2,
        errorStyle: const TextStyle(fontSize: 12),
        suffixIcon: _visibilidadContrasena(),
      ),
      validator: (value) => _obtenerMensajeErrorContrasena(value ?? ""),
    ),
  );
}

String? _obtenerMensajeErrorContrasena(String contrasena) {
  // Validar la longitud mínima
  if (contrasena.length < 8) {
    return 'Debe tener mínimo 8 caracteres.';
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
    return 'Debe contener mínimo un dígito.';
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
      obscureText: _obscureText2,
      decoration: InputDecoration(
        hintText: "Repite la contraseña",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12),
        suffixIcon: _visibilidadRepContrasena(),
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
      controller: _celularController,
      style: const TextStyle(fontSize: 16),
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


Widget botonModificar(){

  return SizedBox(
    width: 250,
    height: 45,
    child: TextButton.icon(
    icon: const Icon(Icons.how_to_reg, color: Color.fromARGB(255, 255, 255, 255),),
    onPressed: (){
        if(_formKey.currentState?.validate() ?? false){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('¡Atención!'),
                content: Text('Al modificar tus datos, tendrás que iniciar sesión nuevamente'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el diálogo
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      _enviarDatos();
                      Navigator.of(context).pop(); // Realiza la modificación
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              );
            },
          );
          //Añadir a base de datos
        }
    },
    label: const Text("Actualizar información", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 17)),
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 80, 8, 212),
      padding: const EdgeInsets.all(13),
      side: const BorderSide(width: 1, color: Colors.black)
      ),
    ),
    /* child: TextButton(
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
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ingreso()),
          );
        }
      }, 
      child: const Text("Registrarse", style: TextStyle(fontSize: 17, color: Colors.black),)
      
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
  final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
  final correoActual = widget.usuario?.correo;
  final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/modificar_usuario');
  final contrasenaEncriptada = encriptarContrasena(_contrasenaController.text);
  print('Correo actual:${correoActual}');
  print('Correo nuevo:${_correoController.text}');
  // Construye el cuerpo de la solicitud
  final body = jsonEncode({
    'nombre': _nombreController.text,
    'apellidos': _apellidosController.text,
    'correo': _correoController.text,
    'contrasena': contrasenaEncriptada,
    'celular': _celularController.text,
    'correo_actual': correoActual,
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
    print('Datos enviados exitosamente');
    _mostrarMensajeExito(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InicioSesion()),
    );
    sessionProvider.clearUser();
  }
  else if(response.statusCode == 402){
        print('Error al enviar datos: ${response.statusCode}');
    _mostrarMensajeError(context,'Correo ya registrado');
  }
    else {
    // Hubo un error en la solicitud
    print('Error al enviar datos: ${response.statusCode}');
    _mostrarMensajeError(context,'Error en el servidor');
  }
}
void _mostrarMensajeExito(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('¡Éxito!'),
        content: Text('Modificación de usuario exitoso.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    },
  );
}
void _mostrarMensajeError(BuildContext context,error) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('¡Error!'),
        content: Text(error),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    },
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