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
        padding: const EdgeInsets.all(24.0),
        child: _isConnected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size : 80, color: Colors.green,)
                ],
            ):
      ),
    );
  }


}
