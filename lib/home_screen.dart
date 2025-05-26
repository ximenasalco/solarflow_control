import 'package:flutter/material.dart';
import '../widgets/status_card.dart';
import '../widgets/next_schedule.dart';
import '../widgets/battery_status.dart';
import 'historial_screen.dart';
import 'temporizador_screen.dart';
import 'flujo_agua_screen.dart';
import 'humedad_screen.dart';
import 'bateria_screen.dart';
import 'profile_screen.dart';
import 'configuracion_screen.dart';

class HomeScreen extends StatelessWidget{
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.history, 'title': 'Historial', 'page': HistorialScreen()},
    {'icon': Icons.timer, 'title': 'Temporizador', 'page': TemporizadorScreen()},
    {'icon': Icons.water, 'title': 'Nivel de flujo del agua', 'page': FlujoAguaScreen()},
    {'icon': Icons.grass, 'title': 'Nivel de humedad', 'page': HumedadScreen()},
    {'icon': Icons.battery_full, 'title': 'Estado de la batería', 'page': BateriaScreen()},
    {'icon': Icons.person, 'title': 'Perfil', 'page': ProfileScreen()},
    {'icon': Icons.settings, 'title': 'Configuración', 'page': ConfiguracionScreen()},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 125, 1, 1.0),
        iconTheme: IconThemeData(color: Color.fromRGBO(242, 242, 242, 1.0)),
        title: Text('SolarFlow Control', style: TextStyle(color: Color.fromRGBO(242, 242, 242, 1.0))),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(81, 161, 75, 1.0)),
              child: Text('Menú', style: TextStyle(color: Color.fromRGBO(242, 242, 242, 1.0), fontSize: 24)),
            ),
            ...menuItems.map((item) => ListTile(
              leading: Icon(item['icon'], color: Color.fromRGBO(81, 161, 75, 1.0)),
              title: Text(item['title']),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item['page']),
                );
              },
            )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatusCard(),
            SizedBox(height: 20),
            NextSchedule(),
            SizedBox(height: 20),
            BatteryStatus(),
          ],
        ),
      ),
    );
  }
}
