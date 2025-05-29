import 'package:flutter/material.dart';
import '../state/valvula_state.dart';

class NextSchedule extends StatefulWidget{
  const NextSchedule({super.key});

  @override
  State<NextSchedule> createState() => _NextScheduleState();
}

class _NextScheduleState extends State<NextSchedule>{
  late final VoidCallback listener; //listener para escuchar cambios en el estado de la válvula

  @override
  void initState(){
    super.initState(); 
    listener = () => setState(() {}); //inicializa el listener que actualiza la UI cuando cambia el estado
    ValvulaState.addListener(listener);
  }

  @override
  void dispose(){
    ValvulaState.removeListener(listener); 
    super.dispose();
  }

  String getTextoProximaApertura(){ 
    if (ValvulaState.isOpen) return "Justo ahora";
    return "Indefinido";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, color: Color.fromRGBO(7, 125, 1, 1.0)),
        const SizedBox(width: 10),
        Text('Próxima apertura: ${getTextoProximaApertura()}',style: const TextStyle(fontSize: 16),),
      ],
    );
  }
}

