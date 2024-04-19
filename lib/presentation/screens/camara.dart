import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
//import 'package:firebase_core/firebase_core.dart';
import 'package:rostros_encontrados/shared/services/upload_picture_firebase_encontrados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void _descargarImagen(nombreImagen) async {
    final url2 = Uri.parse('http://rostrosencontrados.pythonanywhere.com/comparar_imagenes');
    final body = jsonEncode({
      'nombre': nombreImagen,
    });

    // Realiza la solicitud HTTP POST
    final responsePost = await http.post(
      url2,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    // Verifica el estado de la respuesta
    if (responsePost.statusCode == 200) {
      // La solicitud fue exitosa
      print('Datos enviados exitosamente');
    } else {
      // Hubo un error en la solicitud
      print('Error al descargar imagen ${responsePost.statusCode}');
    }
}

Storage storage = Storage();

class Camara extends StatelessWidget {
    final User? usuario;
  const Camara({super.key,this.usuario});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selecciona una opción:",
              style: TextStyle(
                fontSize: 28.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0),),
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles();

                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Imagen no seleccionada'),
                      ),
                    );
                    return null;
                  }

                  else {
                    try {
                      final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/enviar_nombre_imagen');
                      // Construye el cuerpo de la solicitud con los datos que deseas enviar

                      // Realiza la solicitud HTTP POST
                      final response = await http.get(url);

                      var nombreImagen = '';

                      // Verifica el estado de la respuesta
                      if (response.statusCode == 200) {
                        // La solicitud fue exitosa
                        final data = json.decode(response.body);
                        nombreImagen = data['ultima_imagen'];
                        print('Nombre de la imagen: $nombreImagen');
                        final ruta = results.files.single.bytes;
                        print('Hasta aquí todo bien');
                        await storage.subirArchivo(ruta, nombreImagen).then((value) => print('Imagen subida'));
                        _descargarImagen(nombreImagen);
                      } else {
                        // Hubo un error en la solicitud
                        print('Error al enviar datos: ${response.statusCode}');
                      }
                    }
                    catch (e) {
                      print('No se completó la acción deseada');
                    }
                  } 
                  },
                  label: const Text("    Galería       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black)
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton.icon(
                  icon: const Icon(Icons.camera, color: Color.fromARGB(255, 0, 0, 0),),
                  onPressed: () async {
                    final picker = ImagePicker();
                  final results = await picker.pickImage(
                                          source: ImageSource.camera,
                                          imageQuality: 80,
                                          preferredCameraDevice: CameraDevice.rear
                                          );

                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Imagen no seleccionada'),
                      ),
                    );
                    return null;
                  }

                  else {
                    try {
                      final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/enviar_nombre_imagen');
                      // Construye el cuerpo de la solicitud con los datos que deseas enviar

                      // Realiza la solicitud HTTP POST
                      final response = await http.get(url);

                      var nombreImagen = '';

                      // Verifica el estado de la respuesta
                      if (response.statusCode == 200) {
                        // La solicitud fue exitosa
                        final data = json.decode(response.body);
                        nombreImagen = data['ultima_imagen'];
                        print('Nombre de la imagen: $nombreImagen');
                        List<int> fileBytes = await results.readAsBytes();
                        Uint8List uint8List = Uint8List.fromList(fileBytes);
                        final ruta = uint8List;
                        print('Hasta aquí todo bien');
                        await storage.subirArchivo(ruta, nombreImagen).then((value) => print('Imagen subida'));
                        _descargarImagen(nombreImagen);
                      } else {
                        // Hubo un error en la solicitud
                        print('Error al enviar datos: ${response.statusCode}');
                      }
                    }
                    catch (e) {
                      print('No se completó la acción deseada');
                    }
                  }
                  },
                  label: const Text("     Cámara       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}