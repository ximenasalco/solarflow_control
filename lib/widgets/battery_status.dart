// lib/widgets/battery_status.dart
import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.battery_full, color: Color.fromRGBO(7, 125, 1, 1.0)),
        SizedBox(width: 10),
        Text('Batería: 96%', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
