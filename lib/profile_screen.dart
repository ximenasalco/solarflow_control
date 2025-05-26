import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  final nameController = TextEditingController();
  String? savedName;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString("user_name") ?? '';
      nameController.text = savedName!;
    });
  }

  Future<void> _savedName()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', nameController.text.trim());

    setState(() {
      savedName = nameController.text.trim();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nombre guardado: $savedName')),
    );
  }

  Future<void> _logOut()async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'No registrado';

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/usericon.png'),),
            const SizedBox(height: 20),
            Text(email, style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre', hintStyle: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _savedName,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Guardar nombre', style: TextStyle(fontSize: 16, color: Color.fromRGBO(242, 242, 242, 1.0))),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _logOut,
              icon: const Icon(Icons.logout, color: Color.fromRGBO(242, 242, 242, 1.0)),
              label: const Text("Cerrar sesión", style: TextStyle(fontSize: 16, color: Color.fromRGBO(242, 242, 242, 1.0)),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              
            ),
          ]
        )
      )
    );
  }
}