import 'package:flutter/material.dart';

class BateriaScreen extends StatelessWidget{
  const BateriaScreen({super.key});

  final double voltajeActual = 11.5;
  final double tiempoRest = 23;
  final double bateriaRest = 96;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de Batería'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.battery_charging_full, size: 80, color: Color.fromRGBO(81, 161, 75, 1.0)),
                const SizedBox(height: 20),
                Text(
                  'Voltaje Actual: $voltajeActual V',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  'Batería: $bateriaRest %',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  'Tiempo restante: $tiempoRest h',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  'Recarga activa con panel solar',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
  }
}