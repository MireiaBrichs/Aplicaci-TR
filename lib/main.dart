import 'package:app_tr/pages/secondpage.dart';
import 'package:app_tr/services/pacient_service.dart';
import 'package:app_tr/widgets/button_edition_pill.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/pacient.dart';


///MAIN inicial de la aplicació
void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => PacientService(),
      ),
    ],
    child: MaterialApp(
      home: FirstRoute(),
    ),
  ));
}




class FirstRoute  extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  void initState() {

    super.initState();

    //Recuperem les dades del pacient o sino creem un de nou
    PacientService _pacientService = Provider.of<PacientService>(context, listen: false);

    _pacientService.recoverInfoPacient();

  }







  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ENPASTILLAT',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey [900],
      ),

      body: Consumer<PacientService>(
          builder: (context, pacientService, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    child: const Text('CONNECTAR',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      ///Funció per conectar al bluethoot

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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Dades del Pacient: ",
                          style: TextStyle(
                            fontSize:20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (){
                              //Funció per editar les dades del pacient


                            },
                            child:Text("Editar",
                              style: TextStyle(
                                fontSize: 20,
                              ),)
                        ),
                      ),
                    ),


                  ],
                ),

                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(pacientService.pacient!.name!,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue[800],
                        ),),
                      Text(pacientService.pacient!.age!,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue[800],
                        ),)
                    ],
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
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text('Medicaments registrats:',
                          style: TextStyle(
                            fontSize:20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (){
                            //Funció per afegir pastilla

                          },
                          child:Text("Afegir Pastilla",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),)
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 5,
                  indent: 10,
                  endIndent: 10,
                  color: Color(0x5D000000),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pacientService.pills!.length,
                    itemBuilder: _EditionButtonBuilder,

                  ),
                ),







              ],
            );
          }),


      );
 }

  Widget _EditionButtonBuilder(BuildContext context, int index) {
    var colorsButton = [Colors.lightBlue[200],Colors.lightBlue[200],Colors.lightBlue[200],Colors.lightBlue[200],Colors.lightBlue[200],Colors.lightBlue[200]];



    return ButtonEditionPill(
      colorButton: colorsButton[index],
      index: index,

    );


  }
}


