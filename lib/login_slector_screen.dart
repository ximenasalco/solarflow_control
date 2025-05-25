import 'package:flutter/material.dart';

class LoginSelectorScreen extends StatelessWidget{
  const LoginSelectorScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //title: const Text('SolarFlow Control'), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a SolarFlow',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(7, 125, 1, 1.0)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login screen
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16, color: Color.fromRGBO(97, 158, 171, 1.0), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the sign-up screen
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Registrarse', style: TextStyle(fontSize: 16, color: Color.fromRGBO(97, 158, 171, 1.0), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}