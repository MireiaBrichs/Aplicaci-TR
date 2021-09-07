import 'package:app_tr/pages/pillCreation.dart';
import 'package:flutter/material.dart';


class ButtonEditionPill extends StatelessWidget {

  final Color? colorButton;
  final int? index;

  const ButtonEditionPill( {required this.colorButton, required this.index ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Container(
        height: 80,
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: ElevatedButton(
          child: const Text('Prem per editar',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PillCreation()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue[400],
          ),
        ),
      ),
    );
  }
}
