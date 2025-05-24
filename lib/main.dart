import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_slector_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import 'historial_screen.dart';
import 'temporizador_screen.dart';
import 'flujo_agua_screen.dart';
import 'humedad_screen.dart';
import 'bateria_screen.dart';
import 'profile_screen.dart'; 
import 'configuracion_screen.dart';
import 'valve_setup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // necesario para await en main()
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SolarFlowApp());
}

class SolarFlowApp extends StatelessWidget {
  const SolarFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SolarFlow Control',
      theme: ThemeData(
        primaryColor: const Color(0xFF2C7C3D),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF55C3D3),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSelectorScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/historial': (context) => const HistorialScreen(),
        '/temporizador': (context) => const TemporizadorScreen(),
        '/flujo': (context) => const FlujoAguaScreen(),
        '/humedad': (context) => const HumedadScreen(),
        '/bateria': (context) => const BateriaScreen(),
        '/perfil': (context) => const ProfileScreen(),
        '/configuracion': (context) => const ConfiguracionScreen(),
        '/valveSetup': (context) => const ValveSetupScreen(),
      },
    );
  }
}
