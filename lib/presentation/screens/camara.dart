import 'package:flutter/material.dart';
import 'package:rostros_encontrados/shared/services/camera_gallery_service_impl.dart';

class Camara extends StatelessWidget {
  const Camara({super.key});
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
                  icon: const Icon(Icons.camera, color: Color.fromARGB(255, 0, 0, 0),),
                  onPressed: (){
                    CameraGalleryServiceImpl().takePhoto();
                  },
                  label: const Text("    Cámara       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 229, 8),
                    padding: const EdgeInsets.all(18),
                    side: const BorderSide(width: 1, color: Colors.black)
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton.icon(
                  icon: const Icon(Icons.image, color: Color.fromARGB(255, 0, 0, 0),),
                  onPressed: (){
                    CameraGalleryServiceImpl().selectPhoto();
                  },
                  label: const Text("     Galería       ", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22)),
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