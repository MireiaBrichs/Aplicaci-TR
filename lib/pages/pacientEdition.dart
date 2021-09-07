
import 'package:flutter/material.dart';


class PacientEdition extends StatefulWidget {
  const PacientEdition({Key? key}) : super(key: key);

  @override
  _PacientEditionState createState() => _PacientEditionState();
}

class _PacientEditionState extends State<PacientEdition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey [900],
      ),


    );
  }
}
