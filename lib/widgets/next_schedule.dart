import 'package:flutter/material.dart';
import '../state/valvula_state.dart';

class NextSchedule extends StatelessWidget {
  const NextSchedule({super.key});

  String getTextoProximaApertura() {
    if (ValvulaState.isOpen) return 'Justo ahora';

    if (ValvulaState.horaInicio != null) {
      final h = ValvulaState.horaInicio!.hour.toString().padLeft(2, '0');
      final m = ValvulaState.horaInicio!.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }

    return 'No programado';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, color: Color.fromRGBO(7, 125, 1, 1.0)),
        const SizedBox(width: 10),
        Text(
          'Próxima apertura: ${getTextoProximaApertura()}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
