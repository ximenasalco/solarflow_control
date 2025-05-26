import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ValveSetupScreen extends StatefulWidget {
  const ValveSetupScreen({super.key});

  @override
  State<ValveSetupScreen> createState() => _ValveSetupScreenState();
}

class _ValveSetupScreenState extends State<ValveSetupScreen> {
  int pasoactual = 0;
  final _ssidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codigoController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSSID();
  }

  void _loadSSID() async {
    final prefs = await SharedPreferences.getInstance();
    final savedssid = prefs.getString('ssid');
    if (savedssid != null) {
      _ssidController.text = savedssid;
    }
  }

  void nextStep() async {
    if (pasoactual == 0 &&
        (_ssidController.text.isEmpty || _passwordController.text.isEmpty)) {
      showError("Llena los datos de la red Wi-Fi");
      return;
    }

    if (pasoactual == 1 && _codigoController.text.isEmpty) {
      showError("Ingresa el código de la válvula");
      return;
    }

    if (pasoactual == 0) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('ssid', _ssidController.text.trim());
    }

    setState(() {
      pasoactual++;
    });

    if (pasoactual == 2) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
    }
  }

  void showError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  void finishSetup() async {
    final prefs = await SharedPreferences.getInstance();
    final email = FirebaseAuth.instance.currentUser?.email;

    if (email != null) {
      await prefs.setBool('valveConfigured_$email', true);
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      pasoWifi(),
      pasoEmparejar(),
      pasoVerificar(),
      pasoFinal()
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Configuración de la válvula")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: steps[pasoactual],
      ),
    );
  }

  Widget pasoWifi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Paso 1: Conexión WiFi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextField(
          controller: _ssidController,
          decoration: const InputDecoration(
            labelText: 'Nombre de red (SSID)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
              foregroundColor: Color.fromRGBO(242, 242, 242, 1.0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Enviar y continuar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          ),
        ),
      ],
    );
  }

  Widget pasoEmparejar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Paso 2: Emparejar válvula',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextField(
          controller: _codigoController,
          decoration: const InputDecoration(
            labelText: 'Código de emparejamiento',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
              foregroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Enviar y continuar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget pasoVerificar() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isLoading) ...[
            const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 16),
          ] else ...[
            const Icon(Icons.check_circle,color: Color.fromRGBO(81, 161, 75, 1), size: 48),
            const SizedBox(height: 16),
            const Text('Válvula emparejada correctamente',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
                foregroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Continuar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            )
          ],
        ],
      )
    );
  }

  Widget pasoFinal() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle,
              color: Color.fromRGBO(81, 161, 75, 1), size: 48),
          const SizedBox(height: 16),
          const Text('Configuración completada',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: finishSetup,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(81, 161, 75, 1.0),
              foregroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Finalizar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      )
    );
  }
}
