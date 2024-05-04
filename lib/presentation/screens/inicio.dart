import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/ajustes_usuario.dart';
import 'package:provider/provider.dart';
import 'package:rostros_encontrados/presentation/screens/session_provider.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Inicio extends StatelessWidget {
  final User? usuario;
  const Inicio({Key? key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Bienvenido, ${usuario!.nombre}",
              style: const TextStyle(color: Colors.black, fontSize: 20.0, decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
            IconButton(
              onPressed: () {
                final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
                final user = sessionProvider.user;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjustesUsuario(user:user)),
                );
              },
              iconSize: 30,
              icon: const Icon(Icons.person, color: Colors.black),
              alignment: Alignment.topRight,
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: obtenerRegistrosUsuario(usuario!.id), // Llama a la función para obtener los registros del usuario
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Muestra un indicador de carga mientras se obtienen los registros
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}"); // Muestra un mensaje de error si ocurre un error
          } else if (snapshot.hasData) {
            // Muestra los registros obtenidos
            final registros = snapshot.data!;
            return registros.isEmpty
            ? const Center(
                child: Text(
                  "No tienes ningún registro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
              itemCount: registros.length+1,
              itemBuilder: (BuildContext context, int index) {
                if(index == 0){
                  return const ListTile(
                    title: Text(
                      "Mis Registros",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: registro(registros[index-1], context),
                  );
              }},
            );
          } else {
            return const Center(child: Text("No hay registros disponibles", style: TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none)),);
          }
        },
      ),
    );
  }

   Widget registro(Map<String, dynamic> registro, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(211, 201, 201, 201),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nombre: ${registro['nombre_persona']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),
          const SizedBox(height: 10),
          Text('Apellidos: ${registro['apellido_persona']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),
                    const SizedBox(height: 10),
          Text('Fecha de nacimiento: ${registro['fecha_nac']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),
                    const SizedBox(height: 10),
          Text('Visto por última vez: ${registro['fecha_lugar']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),
                    const SizedBox(height: 10),
          Text('Características: ${registro['caracteristicas']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),
                     const SizedBox(height: 10),
          Text('Datos adicionales: ${registro['datos_adicionales']}',
            style: const TextStyle(color: Colors.black, fontSize: 16.0, decoration: TextDecoration.none),
          ),

          const SizedBox(height: 10),
          botonEditar(context),
        ],
      ),
    );
  }

  Widget botonEditar(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 40,
      child: TextButton.icon(
        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 255, 254, 254),),
        onPressed: () => print("Registro"),
        label: const Text(" Eliminar registro ", style: TextStyle(color: Color.fromARGB(255, 253, 253, 253), fontSize: 17, decoration: TextDecoration.none,)),
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 224, 8, 8),
          padding: const EdgeInsets.all(13),
          side: const BorderSide(width: 1, color: Colors.black)
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> obtenerRegistrosUsuario(int idUsuario) async {
    final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/obtener_registros_usuario/$idUsuario');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // La solicitud fue exitosa
      final List<Map<String, dynamic>> registros = List<Map<String, dynamic>>.from(json.decode(response.body));
      return registros;
    } else {
      // Hubo un error en la solicitud
      print('Error al obtener registros del usuario: ${response.statusCode}');
      return [];
    }
  }
}
