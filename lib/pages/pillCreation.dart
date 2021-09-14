import 'package:app_tr/models/pacient.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

enum NombrePastilles { una, dues, tres, quatre }

class PillCreation extends StatefulWidget {

  const PillCreation({ Key? key}) : super(key: key);
  @override
  State<PillCreation> createState() => _SecondRoute();
}

class _SecondRoute extends State<PillCreation> {
  // var to store
  // onChanged callback
  late String title;
  String text = "Medicament 1";

  final namePillController = TextEditingController();
  NombrePastilles? _character = NombrePastilles.una;

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('APPTR');

    //TODO: hem de buscar la info de la pastilla que ens passen per arguments


    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[400],
      ),
      body: ListView(
        children: <Widget> [
          Container(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: const Text('Introdueix el nom del medicament:')
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              controller: namePillController,
              onChanged: (String value) async {
                title = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,30,10,0),
            child: const Text('Horari:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,0),
            child: const Text('Selecciona tots els dies necessaris:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,0),
            height: 150,
            child: const CheckboxDies(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,20,10,0),
            child: const Text('Escriu totes les hores necessaries:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,10),
            height: 70,
            child: Row(
                children: const <Widget> [
                Expanded(
                  child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ),

                Expanded(
                   child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                 ),

                Expanded(
                    child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Expanded(
                    child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),

                  ),
              ),
              ]
             ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,30,10,0),
            child: const Text('Nombre de pastilles:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,10,0),
            child: const Text('Selecciona el nombre de pastilles que han de ser consumides cada cop:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,0,10,20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 33,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: ListTile(
                          title: const Text('1',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<NombrePastilles>(
                            value: NombrePastilles.una,
                            groupValue: _character,
                            onChanged: (NombrePastilles? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child:ListTile(
                          title: const Text('2',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<NombrePastilles>(
                            value: NombrePastilles.dues,
                            groupValue: _character,
                            onChanged: (NombrePastilles? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 33,
                  child:Row(
                    children: <Widget>[
                      Flexible(
                        child:ListTile(
                          dense:true,
                          title: const Text('3',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<NombrePastilles>(
                            value: NombrePastilles.tres,
                            groupValue: _character,
                            onChanged: (NombrePastilles? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child:ListTile(
                          dense:true,
                          title: const Text('4',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<NombrePastilles>(
                            value: NombrePastilles.quatre,
                            groupValue: _character,
                            onChanged: (NombrePastilles? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: ElevatedButton(
              onPressed: () async{

                //TODO: Arreglar aixo per afegri les coses amb inputs

                Pill pastilleta = Pill(namePillController.text,"2","8","60",DateTime.now());





                Navigator.pop(context);





              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[400],
              ),
              child: const Text('Acceptar'),
            ),
          ),
        ],
      ),
    );
  }

}

class CheckboxDies extends StatefulWidget {
  const CheckboxDies({Key? key}) : super(key: key);

  @override
  CheckboxDiesState createState() => CheckboxDiesState();
}

class CheckboxDiesState extends State<CheckboxDies> {
  Map<String, bool> values = {
    'dilluns': false,
    'dimarts': false,
    'dimecres': false,
    'dijous': false,
    'divendres': false,
    'dissabte': false,
    'diumenge': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
        children: values.keys.map((String key) {
          return  CheckboxListTile(
            title: Text(key),
            value: values[key],
            activeColor:Colors.lightBlue[400],
            checkColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                values[key] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}