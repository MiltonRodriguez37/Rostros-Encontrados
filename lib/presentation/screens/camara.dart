import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/CoincidenciaEncontrada.dart';
import 'package:rostros_encontrados/presentation/screens/AunNoCoincidencias.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:rostros_encontrados/shared/services/upload_picture_firebase_encontrados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Camara extends StatefulWidget {
  final User? usuario;

  const Camara({Key? key, this.usuario}) : super(key: key);

  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  bool isLoading = false;
  final Storage storage = Storage();

  void _mostrarMensajeError(BuildContext context, error) {
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

  void _descargarImagen(BuildContext context, String nombreImagen) async {
    setState(() {
      isLoading = true; // Activar indicador de carga
    });

    try {
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

      if (responsePost.statusCode == 200) {
        // Realiza la solicitud HTTP GET
        final responseGet = await http.get(url2);

        if (responseGet.statusCode == 200) {
          // La solicitud fue exitosa, procesa la respuesta
          final data = json.decode(responseGet.body);
          String? idCoincidencia = data['idCoincidencia'];
          double? porcentajeCoincidencia = data['porcentajeCoincidencia'];

          // Navega a la nueva pantalla con los datos recibidos
          if (idCoincidencia != null && porcentajeCoincidencia != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoincidenciaEncontrada(
                  idCoincidencia: idCoincidencia,
                  porcentajeCoincidencia: porcentajeCoincidencia,
                ),
              ),
            );
          } else {
            print('Error: Datos de coincidencia incompletos');
          }
        } else if (responseGet.statusCode == 404) {
          // Navegar a la pantalla AunNoCoincidencias si no se encontraron coincidencias
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AunNoCoincidencias(),
            ),
          );
        } else {
          print('Error en la respuesta GET ${responseGet.statusCode}');
          print('Respuesta JSON: ${responseGet.body}');
        }
      } else {
        // Añadir mensaje en pantalla
        print('Error al descargar imagen: ${responsePost.statusCode}');
        _mostrarMensajeError(context, 'Error al cargar la imagen, intente de nuevo');
      }
    } catch (e) {
      print('Error en la solicitud HTTP: $e');
    } finally {
      setState(() {
        isLoading = false; // Desactivar indicador de carga
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: isLoading ? null : () async {
                    final results = await FilePicker.platform.pickFiles();

                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Imagen no seleccionada'),
                        ),
                      );
                      return;
                    }

                    try {
                      final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/enviar_nombre_imagen');
                      final response = await http.get(url);

                      var nombreImagen = '';

                      if (response.statusCode == 200) {
                        final data = json.decode(response.body);
                        nombreImagen = data['ultima_imagen'];
                        final ruta = results.files.single.bytes;
                        await storage.subirArchivo(ruta, nombreImagen);
                        _descargarImagen(context, nombreImagen);
                      } else {
                        print('Error al enviar datosjdj: ${response.statusCode}');
                      }
                    } catch (e) {
                      print('No se completó la acción deseada');
                    }
                  },
                  label: const Text("    Galería       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black)
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera, color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: isLoading ? null : () async {
                    final picker = ImagePicker();
                    final results = await picker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 80,
                      preferredCameraDevice: CameraDevice.rear,
                    );

                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Imagen no seleccionada'),
                        ),
                      );
                      return;
                    }

                    try {
                      final url = Uri.parse('http://rostrosencontrados.pythonanywhere.com/enviar_nombre_imagen');
                      final response = await http.get(url);

                      var nombreImagen = '';

                      if (response.statusCode == 200) {
                        final data = json.decode(response.body);
                        nombreImagen = data['ultima_imagen'];
                        List<int> fileBytes = await results.readAsBytes();
                        Uint8List uint8List = Uint8List.fromList(fileBytes);
                        final ruta = uint8List;
                        await storage.subirArchivo(ruta, nombreImagen);
                        _descargarImagen(context, nombreImagen);
                      } else {
                        print('Error al enviar datoskjdksjk: ${response.statusCode}');
                      }
                    } catch (e) {
                      print('No se completó la acción deseada');
                    }
                  },
                  label: const Text("     Cámara       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black)
                  ),
                ),
                const SizedBox(height: 20),
                if (isLoading)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text(
                        'Realizando análisis...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
