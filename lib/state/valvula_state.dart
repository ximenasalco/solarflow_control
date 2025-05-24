import 'package:flutter/material.dart';

class ValvulaState {
  static bool isOpen = false;
  static List<String> historial = [];
  static TimeOfDay? horaInicio;

  static void toggle() {
    isOpen = !isOpen;
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    final s = now.second.toString().padLeft(2, '0');
    final entry = '${isOpen ? 'Apertura' : 'Cierre'} - $h:$m:$s';
    historial.insert(0, entry);
  }

  static void setHoraInicio(TimeOfDay hora) {
    horaInicio = hora;
  }
}
