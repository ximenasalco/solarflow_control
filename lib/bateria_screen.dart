import 'package:flutter/material.dart';

class BateriaScreen extends StatelessWidget{
  const BateriaScreen({super.key});

  final double voltajeActual = 11.5;
  final double voltajeTotal = 12.0;
  final double consumoPromH = 0.5;

  @override
  Widget build(BuildContext context) {
    final porcentaje = (voltajeActual/voltajeTotal*100).clamp(0,100);
    final horasRest = (voltajeActual/consumoPromH).clamp(0,100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de Batería'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(Icons.battery_charging_full, size: 80, color: porcentaje>50 ? Colors.green : porcentaje>20 ? Colors.orange : Colors.red),
            const SizedBox(height: 20),
            Text(
              'Voltaje Actual: ${voltajeActual.toStringAsFixed(1)} V',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Batería: ${porcentaje.toStringAsFixed(0)} %',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Tiempo restante: ${horasRest.toStringAsFixed(1)} h',
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
    );
  }
}