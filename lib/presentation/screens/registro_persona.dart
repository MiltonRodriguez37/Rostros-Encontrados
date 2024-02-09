import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


class Registrar extends StatelessWidget {
  const Registrar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  DateTime? _fechaNacimiento;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaController = TextEditingController();
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
        padding: const EdgeInsets.only(top: 70.0),
        child: Container (
          width: 275,
          height: 580,
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
              campoFechaNac(),
              const SizedBox(height: 10),
              campoFechaLugar(),
              const SizedBox(height: 10),
              campoCaracteristicas(),
              const SizedBox(height: 10),
              campoDatosAdicionales(),
              const SizedBox(height: 20),
              botonAdjuntarImagen(),
              const SizedBox(height: 10),
              botonEnviarDatos(),
            ],
          ),
        ),
      ),
    ),
  )
  );

}

Widget nombre(){
  return const Text("DATOS DEL DESAPARECIDO/A",  textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22.0),);
}

Widget campoNombre(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
    child: TextFormField(
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
    height: 45,
    child: TextFormField(
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
  final RegExp regex = RegExp(r'^[a-zA-Z ]{2,}$');
  return regex.hasMatch(nombre);
}

Widget campoFechaNac(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
    height: 45,
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
    height: 45,
    child: TextFormField(
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
    height: 45,
    child: TextFormField(
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
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Datos adicionales",
        fillColor: Color.fromARGB(255, 236, 236, 236),
        filled: true
      ),
    ),
  );
}
Widget botonAdjuntarImagen() {
  return SizedBox(
    width: 200,
    height: 50,
    child: TextButton.icon(
      icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0),),
      onPressed: _adjuntarImagen,
      label: Text(_imagenSeleccionada != null ? _imagenSeleccionada!.name : "Adjuntar imagen",
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17)),
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 8, 135, 253),
        padding: const EdgeInsets.all(13),
        side: const BorderSide(width: 1, color: Colors.black)
      ),
    ),
  );
}

XFile? _imagenSeleccionada;

void _adjuntarImagen() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _imagenSeleccionada = pickedFile;
    });
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


Widget botonEnviarDatos(){

  return SizedBox(
    width: 190,
    height: 45,
    child: TextButton.icon(
    icon: const Icon(Icons.arrow_forward, color: Color.fromARGB(255, 0, 0, 0),),
    onPressed: (){
        if(_formKey.currentState?.validate() ?? false){
          //Avanza a la siguiente página

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

//https://mundocursos-online.translate.goog/como-poner-una-imagen-en-flutter/?_x_tr_sl=es&_x_tr_tl=de&_x_tr_hl=de&_x_tr_pto=sc

}