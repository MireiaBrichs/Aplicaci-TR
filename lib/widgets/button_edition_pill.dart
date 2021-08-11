import 'package:app_tr/pages/secondpage.dart';
import 'package:flutter/material.dart';


class ButtonEditionPill extends StatelessWidget {

  final Color? colorButton;
  final int? index;

  const ButtonEditionPill( {required this.colorButton, required this.index ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            MaterialPageRoute(builder: (context) => const SecondRoute()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue[400],
        ),
      ),
    );
  }
}
