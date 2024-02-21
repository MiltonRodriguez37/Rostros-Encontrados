import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> subirArchivo(
    var filePath,
    String fileName,
  ) async {
    var file = filePath;

    try {
      await storage.ref('prueba/$fileName').putData(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      }
    }
  }
