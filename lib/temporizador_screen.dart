import 'package:flutter/material.dart';

class TemporizadorScreen extends StatefulWidget {
  const TemporizadorScreen({super.key});

  @override
  State<TemporizadorScreen> createState() => _TemporizadorScreenState();
}

class _TemporizadorScreenState extends State<TemporizadorScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TimeOfDay? horaInicio;
  TimeOfDay? horaFin;

  int horas = 0;
  int minutos = 0;
  int segundos = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> seleccionarHoraInicio() async {
    final seleccion = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (seleccion != null) {
      setState(() {
        horaInicio = seleccion;
      });
    }
  }

  Future<void> seleccionarHoraFin() async {
    final seleccion = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (seleccion != null) {
      setState(() {
        horaFin = seleccion;
      });
    }
  }

  void guardarConfiguracion() {
    if (_tabController.index == 0) {
      print('Inicio: ${horaInicio?.format(context)} - Fin: ${horaFin?.format(context)}');
    } else {
      print('Temporizador por duración: $horas h, $minutos m, $segundos s');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Temporizador guardado correctamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporizador'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Por hora exacta'),
            Tab(text: 'Por duración'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          /// TAB 1 - Por hora exacta
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hora de inicio', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: seleccionarHoraInicio,
                  child: Text(horaInicio != null ? horaInicio!.format(context) : 'Seleccionar hora'),
                ),
                const SizedBox(height: 20),
                const Text('Hora de fin', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: seleccionarHoraFin,
                  child: Text(horaFin != null ? horaFin!.format(context) : 'Seleccionar hora'),
                ),
              ],
            ),
          ),

          /// TAB 2 - Por duración
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Horas'),
                          DropdownButton<int>(
                            value: horas,
                            onChanged: (val) => setState(() => horas = val!),
                            items: List.generate(24, (i) => DropdownMenuItem(value: i, child: Text('$i'))),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Minutos'),
                          DropdownButton<int>(
                            value: minutos,
                            onChanged: (val) => setState(() => minutos = val!),
                            items: List.generate(60, (i) => DropdownMenuItem(value: i, child: Text('$i'))),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Segundos'),
                          DropdownButton<int>(
                            value: segundos,
                            onChanged: (val) => setState(() => segundos = val!),
                            items: List.generate(60, (i) => DropdownMenuItem(value: i, child: Text('$i'))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: guardarConfiguracion,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(7, 125, 1, 1.0),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('Guardar', style: TextStyle(fontSize: 18), selectionColor: Color.fromRGBO(242, 242, 242, 1.0),),
        ),
      ),
    );
  }
}
