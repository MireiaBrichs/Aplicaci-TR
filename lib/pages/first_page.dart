import 'dart:convert';

import 'package:MedsRemainder/pages/pill_creation.dart';
import 'package:MedsRemainder/services/pacient_service.dart';
import 'package:MedsRemainder/widgets/button_edition_pill.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('meds remainder',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey [900],
        ),
        body: FutureBuilder<int>(
            future: _recoveringInfoUser(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Container();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    return Consumer<PacientService>(
                        builder: (context, pacientService, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton(
                                  child: const Text('CONNECTAR',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    //Funció per afegir pastilla
                                    Navigator.pushNamed(
                                        context, 'bluethoothConection');



                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey [700],
                                  ),
                                ),
                              ),

                              Divider(
                                thickness: 5,
                                indent: 10,
                                endIndent: 10,
                                color: Color(0x5D000000),
                              ),


                              Row(
                                children: [
                                  const Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: Text(
                                        "Dades del Pacient: ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0,10,10,0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            //Funció per editar les dades del pacient
                                            Navigator.pushNamed(
                                                context, 'pacientEdition');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent [200],
                                          ),
                                          child: const Text("Editar",
                                            style: TextStyle(
                                              fontSize: 20,
                                              //color: Colors.black
                                            ),
                                          ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),


                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,10),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment
                                     // .spaceEvenly,
                                  children: [
                                    Text(pacientService.pacient == null
                                        ? ""
                                        : pacientService.pacient!.name!,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey[800],
                                      ),),
                                    Container(
                                      width: 16,
                                    ),
                                    Text(pacientService.pacient!.age!,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey[800],
                                      ),),
                                  ],
                                ),
                              ),

                              const Divider(
                                thickness: 5,
                                indent: 10,
                                endIndent: 10,
                                color: Color(0x5D000000),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: const Text(
                                        'Medicaments Registrats:',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,10,0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          //Funció per afegir pastilla
                                          Navigator.pushNamed(
                                            context, 'pillCreation'
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent [200],
                                        ),
                                        child: const Text("Afegir Pastilla",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),)
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                              // const Divider(
                              //   thickness: 5,
                              //   indent: 10,
                              //   endIndent: 10,
                              //   color: Color(0x5D000000),
                              // ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: pacientService.pills!.length,
                                  itemBuilder: _EditionButtonBuilder,
                                ),
                              ),


                            ],
                          );
                        });
                  }
              }
            })
    );
  }

  Widget _EditionButtonBuilder(BuildContext context, int index) {
    var colorsButton = [Colors.lightBlue[200],Colors.green[700],Colors.yellow[700],Colors.deepOrange[400],Colors.pink[300],Colors.blue[900]];
    PacientService instance = Provider.of<PacientService>(context,
        listen: false);

    Map<String,dynamic> pill = jsonDecode(instance.pills![index]);

    DateTime pickDate = DateTime.parse(pill['firstTake']);
    print(pickDate.day);

    DateTime finalDate = pickDate.add(Duration(days: int.parse(pill['days'])));
    Duration daysToEnd = finalDate.difference(DateTime.now());


    return ButtonEditionPill(
      name: pill['name'],
      number: pill['number'],

      colorButton: colorsButton[index],
      index: index,

    );


  }

  Future<int> _recoveringInfoUser() async{
    PacientService instance = Provider.of<PacientService>(context,
        listen: false);
    await instance.recoverInfoPacient();


    return 0;
  }
}