import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ValveSetupScreen extends StatefulWidget {
  const ValveSetupScreen({super.key});

  @override
  State<ValveSetupScreen> createState() => _ValveSetupScreenState();
}

class _ValveSetupScreenState extends State<ValveSetupScreen> {
  final _ssidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isConnected = false;

  @override
  void initState(){
    super.initState();
    _loadSSID();
  }

  void _loadSSID() async{
    final prefs = await SharedPreferences.getInstance();
    final savedssid = prefs.getString('ssid');
    if(savedssid != null){
      _ssidController.text = savedssid;
    }
  }

  void connectvalve() async {
    if (_ssidController.text.isEmpty || _passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text ("Completa los datos de la red"),)
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ssid', _ssidController.text);

    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      _isLoading = false;
      _isConnected = true;
    });
  }

  void continueSetup(){
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración de la válvula')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _isConnected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size : 80, color: Color.fromRGBO(81, 161, 75, 1.0)),
                  SizedBox(height: 20),
                  const Text('Conexión exitosa', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  const Text('La válvula se ha conectado a la red Wi-Fi', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: continueSetup, 
                    child: const Text('¡Listo, comencemos!', style: TextStyle(fontSize: 16, color: Color.fromRGBO(81, 161, 75, 1.0))),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Paso 1. Ingresa la red WIFI", style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _ssidController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre de la red',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : connectvalve,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Conectar a la válvula", style: TextStyle(color: Colors.white)),
                    )
                  )
                ]
            )
      ),
    );
  }


}
