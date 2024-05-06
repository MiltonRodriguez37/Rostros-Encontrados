import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:rostros_encontrados/presentation/screens/ingreso.dart';
import 'package:rostros_encontrados/shared/services/upload_picture_firebase.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'dart:typed_data';

/* import 'package:firebase_core/firebase_core.dart'; */

/* Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: 'apiKey', 
      appId: 'appId', 
      messagingSenderId: 'messagingSenderId', 
      projectId: 'projectId',
      storageBucket: "gs://rostros-encontrados.appspot.com"));
} */

class Registrar extends StatelessWidget {
  final User? usuario;
  const Registrar({Key? key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home(usuario: usuario);
  }
}


class Home extends StatefulWidget {
  final User? usuario;
  const Home({Key? key, this.usuario}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? _fechaNacimiento;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _fechaLugarController = TextEditingController();
  final TextEditingController _caracteristicasController = TextEditingController();
  final TextEditingController _datosAdicionalesController = TextEditingController();
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
              campoNombre(),
              const SizedBox(height: 10),
              campoApellidos(),
              const SizedBox(height: 10),
              campoFechaLugar(),
              const SizedBox(height: 10),
              campoCaracteristicas(),
              const SizedBox(height: 10),
              campoDatosAdicionales(),
              const SizedBox(height: 10),
              campoFechaNac(),
              const SizedBox(height: 20),
              botonAdjuntarImagen(),
              const SizedBox(height: 10),
              botonEnviarDatos(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  )
  )
  );

}

Widget nombre(){
  return const Text("DATOS DEL DESAPARECIDO/A",  textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoNombre(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextFormField(
      controller: _nombreController,
      decoration: const InputDecoration(
        hintText: "Nombre",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa el nombre';
        }  else if(! _esNombreApellidoValido(value ?? "")){
          return 'Solo letras y al menos 2 caracteres';
        }
        return null;
      },
    ),
  );
}

Widget campoApellidos(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextFormField(
      controller: _apellidosController,
      decoration: const InputDecoration(
         //contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: "Apellidos",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12)
      ),
      validator: (value) {
        if(value?.isEmpty ?? true){
          return 'Por favor, ingresa el apellido';
        }  else if(! _esNombreApellidoValido(value ?? "")){
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

Widget campoFechaNac(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextField(
      controller: _fechaController,
      decoration: const InputDecoration(
        hintText: "Fecha de nacimiento",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
      onTap: () async {
        DateTime? fechaSeleccionada = await _seleccionarFecha(context);
        if(fechaSeleccionada != null){
          _fechaController.text = DateFormat('dd-MM-yyyy').format(fechaSeleccionada);
          setState(() {
            _fechaNacimiento = fechaSeleccionada;
          });
        }
      },
      readOnly: true,
      style: const TextStyle(fontSize: 16),
    ),
  );
}

Future<DateTime?> _seleccionarFecha(BuildContext context) async {
  return showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
}

Widget campoFechaLugar(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextFormField(
      controller: _fechaLugarController,
      decoration: const InputDecoration(
        hintText: "Fecha y lugar último avistamiento",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12),
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Completa los campos';
        }
        return null;
      },
    ),
  );
}

Widget campoCaracteristicas(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextFormField(
      controller: _caracteristicasController,
      decoration: const InputDecoration(
        hintText: "Características particulares",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12),
      ),
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Completa los campos';
        }
        return null;
      },
    ),
  );
}

Widget campoDatosAdicionales(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 55,
    child: TextFormField(
      controller: _datosAdicionalesController,
      decoration: const InputDecoration(
        hintText: "Datos adicionales",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true,
        errorStyle: TextStyle(fontSize: 12),
      ),
       validator: (value){
        if(value?.isEmpty ?? true){
          return 'Completa los campos';
        }
        return null;
      },
    ),
  );
}
Widget botonAdjuntarImagen() {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.75,
    height: 50,
    child: TextButton.icon(
      icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0),),
      onPressed: _adjuntarImagen,
      label: Text(_imagenSeleccionada != null ? _imagenSeleccionada.name : "Adjuntar imagen",
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17)),
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 8, 135, 253),
        padding: const EdgeInsets.all(13),
        side: const BorderSide(width: 1, color: Colors.black)
      ),
    ),
  );
}

var _imagenSeleccionada;

void _adjuntarImagen() async {
  final picker = ImagePicker();
  final results = await picker.pickImage(source: ImageSource.gallery);
  //final results = await FilePicker.platform.pickFiles();

  if (results != null) {
    setState(() {
      _imagenSeleccionada = results;
    });
  } else{
    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Imagen no seleccionada'),
                    ),
                  );
                  return null;
  }
}
/* Widget botonAdjuntarImagen(){

  return SizedBox(
    width: 190,
    height: 45,
    child: TextButton.icon(
    icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0),),
    onPressed: (){
        if(_formKey.currentState?.validate() ?? false){
          //Avanza a la siguiente página

        }
    },
    label: const Text("Adjuntar imagen", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17)),
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 8, 135, 253),
      padding: const EdgeInsets.all(13),
      side: const BorderSide(width: 1, color: Colors.black)
      ),
    ),
   /*  child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 8, 135, 253),
        //padding: EdgeInsets.symmetric(horizontal:100, vertical: 3),
        padding: const EdgeInsets.all(20), //content padding inside button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: (){
        if(_formKey.currentState?.validate() ?? false){

        }
      }, 
      child: const Text("Adjuntar imagen", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ), */
  );
} */

final Storage storage = Storage();

Widget botonEnviarDatos(){
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.75,
    height: 50,
    child: TextButton.icon(
    icon: const Icon(Icons.arrow_forward, color: Color.fromARGB(255, 0, 0, 0),),
    onPressed: () async{
        if(_formKey.currentState?.validate() ?? false){
          //Avanza a la siguiente página
          if (_imagenSeleccionada == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Por favor, adjunta una imagen')),
            );
            return;
          }

          if (_fechaNacimiento == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Por favor, selecciona una fecha de nacimiento')),
            );
            return;
          }
            try {
              _enviarDatos();

              final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/registrar_persona');
              final response = await http.get(url);
              final decoded = json.decode(response.body);
              
              List<int> fileBytes = await _imagenSeleccionada.readAsBytes();
              Uint8List uint8List = Uint8List.fromList(fileBytes);
              final ruta = uint8List;
              final nombreImagen = decoded['id'];
              print('Hasta aquí todo bien');
              final urlFirebase = await storage.subirArchivo(ruta, nombreImagen);
              print('imagen subida');
              _mostrarMensajeExito(context);
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ingreso()),
            );
            }
            catch (e) {
                    print('No se completó el registro');
                    _mostrarMensajeError(context);
                  }
        }
    },
    label: const Text("Enviar datos", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17)),
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 253, 229, 8),
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

        }
      }, 
      child: const Text("Enviar datos", style: TextStyle(fontSize: 17, color: Colors.black),)
      
    ), */
  );
}

void _enviarDatos() async {
  final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/registrar_persona');
  final fechaNacimientoString = _fechaNacimiento?.toIso8601String().substring(0, 10);
  final body = jsonEncode({
    'nombre': _nombreController.text,
    'apellidos': _apellidosController.text,
    'fechaNacimiento': fechaNacimientoString,
    'fechaLugar': _fechaLugarController.text,
    'caracteristicas': _caracteristicasController.text,
    'datosAdicionales': _datosAdicionalesController.text,
    'idUsuario': widget.usuario!.id
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
  } else {
    // Hubo un error en la solicitud
    print('Error al enviar datos: ${response.statusCode}');
  }
}

void _mostrarMensajeExito(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('¡Éxito!'),
        content: Text('Registro exitoso.'),
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
void _mostrarMensajeError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('¡Error!'),
        content: Text('Error en el servidor, no se completó el registro.'),
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

//https://mundocursos-online.translate.goog/como-poner-una-imagen-en-flutter/?_x_tr_sl=es&_x_tr_tl=de&_x_tr_hl=de&_x_tr_pto=sc

}

