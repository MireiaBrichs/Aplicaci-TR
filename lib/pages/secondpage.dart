import 'package:app_tr/models/pacient.dart';
import 'package:app_tr/pages/secondpage2.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';


class SecondRoute extends StatefulWidget {

  const SecondRoute({ Key? key}) : super(key: key);
  @override
  State<SecondRoute> createState() => _SecondRoute();
}

class _SecondRoute extends State<SecondRoute> {
  // var to store
  // onChanged callback
  late String title;
  String text = "Medicament 1";

  final namePillController = TextEditingController();


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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: const Text('Introdueix el nom del medicament:')
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,10,0,0),
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
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: const Text('Horari:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,10,0,10),
            child: const Text('Selecciona totes les hores necessaries:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            height: 210,
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dll'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dm'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dx'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dj'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dv'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('ds'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      width: 50,
                      child: const Text('dg'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('hora'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: const Text('Nombre de pastilles:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,10,0,0),
            child: const Text('Selecciona el nombre de pastilles que han de ser consumides cada cop:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,0,0,10),
            height: 80,
            child: const MyStatefulWidget(),

          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: ElevatedButton(
              onPressed: () async{

                Pill pastilleta = Pill();

                pastilleta.name= namePillController.text;

                pastilleta.number= "quatre";

                var pacient = storage.getItem('pacient');
                Pacient pacientClean = Pacient(
                    pacient['name'],pacient['age'],pacient['pills'] as List<Pill>);

                if(pacientClean.pills == null){
                  //Primera pastilla

                  List<Pill> newVec = [];
                  newVec.add(pastilleta.toJSONEncodable());

                  pacientClean.pills=newVec;

                }else {
                  if (pacientClean.pills!.length > 6) {
                    print("No more pastilles");
                  } else {
                    pacientClean.pills!.add(pastilleta);
                  }

                }
                print(pacientClean.pills![0].toString());
                storage.setItem('pacient', pacientClean.toJSONEncodable());


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

