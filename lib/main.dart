import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa Firebase Core
import 'home.dart'; // Importa el archivo home.dart

// Configuración de Firebase (puedes copiar y pegar esta configuración desde tu consola de Firebase)
const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyBSR7vb_a_wefV0rb5BVTztuBSz-KA1rEY",
  authDomain: "base-de-datos-d32cc.firebaseapp.com",
  projectId: "base-de-datos-d32cc",
  storageBucket: "base-de-datos-d32cc.firebasestorage.app",
  messagingSenderId: "1084999997924",
  appId: "1:1084999997924:web:ac63aafef77f4e8387cff1",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig); // Inicializa Firebase con la configuración
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeScreen(), // Pantalla de inicio
    );
  }
}
