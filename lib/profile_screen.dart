import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[
            const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/profile.jpg')),
            const SizedBox(height: 16),
            const Text(
              'Nombre de Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'aximenasc16@gmail.com', style:TextStyle(fontSize: 16)
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: (){
              }, 
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar Sesión'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            )
          ]
        )
      )
    );
  }
}