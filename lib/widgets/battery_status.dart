// lib/widgets/battery_status.dart
import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.battery_full, color: Color(0xFFB68E38)),
        SizedBox(width: 10),
        Text('Batería: 85%', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
