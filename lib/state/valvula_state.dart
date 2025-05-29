import 'package:flutter/material.dart';

class ValvulaState {
  static bool isOpen = false;
  static final List<String> historial = [];
  static TimeOfDay? horaInicio;
  static final List<VoidCallback> _listeners = [];

  static void addListener(VoidCallback callback) { //agrega un listener
    _listeners.add(callback);
  }
  static void removeListener(VoidCallback callback) { //elimina un listener
    _listeners.remove(callback);
  }

  static void _notify(){ //notifica a todos los listeners
    for (var callback in _listeners) {
      callback();
    }
  }

  static void open(){ //abrir la válvula y registrar en el historial
    isOpen = true;
    _aggHistorial("Válvula abierta");
    _notify(); 
  }

  static void close(){ //cerrar la válvula y registrar en el historial
    isOpen = false;
    _aggHistorial("Válvula cerrada");
    _notify();
  }

  static void toggle(){ //cambiar estado de la válvula
    isOpen = !isOpen;
    _aggHistorial(isOpen 
      ? "Válvula abierta" 
      : "Válvula cerrada");
    _notify();
  }

  static void setHoraInicio(TimeOfDay hora) { //establecer hora de inicio
    horaInicio = hora;
    _notify();
  }
  
  

  static void _aggHistorial(String mensaje){ //entrada al historial con hora y fecha
    final ahora = DateTime.now().toLocal();
    final tiempo = "${ahora.hour.toString().padLeft(2, '0')}:${ahora.minute.toString().padLeft(2, '0')}";
    final fecha = "${ahora.year}-${ahora.month.toString().padLeft(2, '0')}-${ahora.day.toString().padLeft(2, '0')}";
    historial.add("$mensaje a las $tiempo\n$fecha");
  }
}
