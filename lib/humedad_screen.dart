import 'package:flutter/material.dart';

class HumedadScreen extends StatelessWidget{
  const HumedadScreen({super.key});

  final double humedadActual = 58.0;

  @override
  Widget build(BuildContext context) {
    String state = "Optima";

    if (humedadActual<30){
      state = "Baja";
    }else if
      (humedadActual>70){
      state = "Alta";
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Nivel de humedad")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(Icons.grass, size: 80, color: Colors.green.withOpacity(0.7)),
            const SizedBox(height: 20),
            Text("Humedad del entorno: $humedadActual%", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text("Estado: $state", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text("Radio estimado de medicion: 20/25 cm", style:TextStyle(color:Colors.grey)),
          ]
        )
      )
    );
  }
}