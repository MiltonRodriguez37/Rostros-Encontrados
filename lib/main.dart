import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/start_page.dart';
import 'package:provider/provider.dart';
import 'package:rostros_encontrados/presentation/screens/session_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rostros_encontrados/presentation/screens/inicio_sesion.dart';
import 'package:rostros_encontrados/presentation/screens/registro_usuario.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
  routes: {
    '/inicio_sesion': (context) => const InicioSesion(), // Pantalla de inicio de sesión
    '/registro_usuario': (context) => const RegistrarUsuario(), // Pantalla de registro de usuario
    // Agrega aquí más rutas según sea necesario
  },
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const StartPage(),
      ),
    );
  }
}
