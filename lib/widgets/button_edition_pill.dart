import 'package:MedsRemainder/pages/pill_creation.dart';
import 'package:MedsRemainder/services/pacient_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ButtonEditionPill extends StatelessWidget {


  final Color? colorButton;
  final int? index;
  final String? name;
  final String? number;
  final String? days;

  ButtonEditionPill( {required this.colorButton, required this.index , required this.name, required this.number, required this.days, Key? key}) : super(key: key);







  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Container(
        height: 100,
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorButton,
          ),

          child: Row(
            children: <Widget> [
              Column(
                children: <Widget>[
                  Container (
                    padding: const EdgeInsets.fromLTRB(0,10,0,5),
                    child: Text( name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Container (
                    width: 200,
                    padding: const EdgeInsets.fromLTRB(40,0,0,0),
                    child: Row(
                      children: <Widget>[
                        Text( 'nombre de pastilles: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(number!,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container (
                    width: 200,
                    padding: const EdgeInsets.fromLTRB(40,0,0,0),
                    child: Row(
                      children: <Widget>[
                        Text( 'nombre de dies: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(days!,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),

              IconButton (
                iconSize: 35.0,
                padding: const EdgeInsets.fromLTRB(30,0,20,0),
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PillCreation()),
                  );
                },

            ),
              IconButton (
                iconSize: 35.0,
                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                icon: const Icon(Icons.delete),
                onPressed: () async {
                    PacientService instance =
                    Provider.of<PacientService>(context, listen: false);
                    await instance.eliminarMedicament(index!);

                },
              ),
            ],
          ),

        ),
        ),
      );
  }
}
