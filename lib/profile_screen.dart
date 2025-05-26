import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    nameController.text = user?.displayName ?? '';
  }

  Future<void> guardarNombre() async {
    try {
      await user?.updateDisplayName(nameController.text.trim());
      await user?.reload(); // recargar para obtener el cambio
      user = FirebaseAuth.instance.currentUser;
      setState(() {}); // refrescar UI
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nombre actualizado")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al actualizar el nombre")),
      );
    }
  }

  Future<void> cerrarSesion() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final email = user?.email ?? 'Correo no disponible';

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/usericon.jpg'),
            ),
            const SizedBox(height: 16),
            
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Tu nombre",
                border: OutlineInputBorder(),
              ),
            ),

            
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: guardarNombre,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
              ),
              child: const Text('Guardar nombre', style: TextStyle(fontSize: 16, color: Color.fromRGBO(242, 242, 242, 1.0))),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: cerrarSesion,
              icon: const Icon(Icons.logout, color: Color(0xFFF2F2F2)),
              label: const Text(
                'Cerrar Sesión',
                style: TextStyle(fontSize: 16, color: Color(0xFFF2F2F2)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF51A14B),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
