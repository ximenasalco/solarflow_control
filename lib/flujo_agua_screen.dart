import 'package:flutter/material.dart';

class FlujoAguaScreen extends StatefulWidget{
  const FlujoAguaScreen({super.key});

  @override
  State<FlujoAguaScreen> createState() => _FlujoAguaScreenState();
}

class _FlujoAguaScreenState extends State<FlujoAguaScreen> {
  double flujoActual = 5.0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flujo de Agua'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Ajusta el nivel del flujo de agua (L/min):', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text("${flujoActual.toStringAsFixed(1)} L/min", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Slider(
              activeColor: const Color.fromRGBO(97, 158, 171, 1.0),
              value: flujoActual, 
              min:0, max:20, 
              divisions: 40, 
              label: '${flujoActual.toStringAsFixed(1)}', 
              onChanged: (value){
                setState(() {
                  flujoActual = value;
                });
              }
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Flujo actualizado')),
                );
              }, 
              child: const Text('Guardar Flujo', style: TextStyle(fontSize: 16, color: Color.fromRGBO(97, 158, 171, 1.0))),
            ),
          ],
        ),
      ),
    );
  }
}