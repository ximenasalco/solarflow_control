import 'package:flutter/material.dart';
import '../state/valvula_state.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  void toggleValve() {
    setState(() {
      ValvulaState.toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOpen = ValvulaState.isOpen;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.water_drop,color: isOpen ? Color.fromRGBO(97, 158, 171, 1.0) : Color.fromRGBO(242, 242, 242, 1.0),size: 60,),
            const SizedBox(height: 10),
            Text('Estado de la válvula: ${isOpen ? 'ABIERTA' : 'CERRADA'}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleValve,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C7C3D),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                isOpen ? 'CERRAR VÁLVULA' : 'ABRIR VÁLVULA',
                style: const TextStyle(fontSize: 16, color: Color.fromRGBO(242, 242, 242, 1.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
