import 'package:MedsRemainder/pages/pill_creation.dart';
import 'package:flutter/material.dart';


class ButtonEditionPill extends StatelessWidget {

  final Color? colorButton;
  final int? index;
  final String? name;
  final String? number;

  const ButtonEditionPill( {required this.colorButton, required this.index , required this.name, required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Container(
        height: 80,
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: ElevatedButton(
          child: Text(
            name!,
            style: const TextStyle(
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
