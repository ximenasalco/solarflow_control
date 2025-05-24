import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  Future<void> register() async{
    setState(() {
      loading = true;
    });

    try{
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final newuser = cred.additionalUserInfo?.isNewUser ?? false;
      if (newuser){
        Navigator.pushReplacementNamed(context, '/valveSetup');
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("El usuario ya existe"))
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Error al registrarse"),)
      );
    } finally{
      setState(() {
        loading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Registrarse")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Correo electrónico"
              ),
            
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Contraseña"
              ),
            ),
            const SizedBox(height: 20),
            loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
              onPressed: register,
              child: const Text("Registrarse"),
            ),
          ]
        )
      )
    );
  }
}