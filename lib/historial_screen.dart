import 'package:flutter/material.dart';
import '../state/valvula_state.dart';

class HistorialScreen extends StatelessWidget{
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context){
    final historial = ValvulaState.historial.reversed.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Historial de uso"),),
      body: historial.isEmpty
          ? const Center(child: Text("No hay historial de uso disponible"),)
          : ListView.builder(
            itemCount: historial.length,
            itemBuilder: (context,index){
              final texto = historial[index];
              return ListTile(
                leading: Icon(
                  texto.contains("abierta") ? Icons.lock_open : Icons.lock,
                  color: texto.contains("abierta") ? Color.fromRGBO(81, 161, 75, 1.0) : Color.fromRGBO(182, 142, 56, 1.0),
                ),
                title: Text(texto),
              );
            }
            )
    );
  }
}