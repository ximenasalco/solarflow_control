import 'package:flutter/material.dart';
import '../state/valvula_state.dart';

class HistorialScreen extends StatelessWidget{
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context){
    final historial = ValvulaState.historial;

    return Scaffold(
      appBar: AppBar(title: const Text("Historial de uso"),),
      body: historial.isEmpty
          ? const Center(
            child: Text("No hay historial de uso disponible"),
          )
        : ListView.separated(
          itemCount: historial.length,
          separatorBuilder: (context,index) => const Divider(),
          itemBuilder: (context,index){
            final evento = historial[index];
            final icono = evento.startsWith("Apertura")
                ? Icons.play_arrow
                : Icons.stop;
            return ListTile(
              leading: Icon(icono, color: Colors.green),
              title: Text(evento),
            );
          } 
          )
    );
  }

}