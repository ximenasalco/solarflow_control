import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatelessWidget{
  const ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración'),),
      body: ListView(
        children: const[
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Tema claro/oscuro'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Version de la app'),
            subtitle: Text("v1.0.0"),
          ),
        ]
      )
    );
  }
}