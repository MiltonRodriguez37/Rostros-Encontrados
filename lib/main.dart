import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
//import './presentation/screens/start_page.dart';
//import './principal.dart';
/* void main(){
  runApp(const MyApp());
} */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: 'apiKey', 
      appId: 'appId', 
      messagingSenderId: 'messagingSenderId', 
      projectId: 'projectId',
      storageBucket: "gs://rostros-encontrados.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const StartPage()
    );
  }

}
