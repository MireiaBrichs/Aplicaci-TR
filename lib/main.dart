import 'package:app_tr/pages/secondpage.dart';
import 'package:app_tr/widgets/button_edition_pill.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'models/pacient.dart';

void main() => runApp( const MaterialApp(

  home: FirstRoute(),
));

class FirstRoute  extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){
    final LocalStorage storage = LocalStorage('APPTR');
    Pacient pacient = Pacient("Mireia","17",[]);



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('app tr'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey [900],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            padding: const EdgeInsets.fromLTRB(0,25,0,10),
            child: ElevatedButton(
              child: const Text('CONNECTAR',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey [700],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,10,0,0),
            child: const Text('Medicaments registrats:',
            style: TextStyle(
            fontSize:20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: _EditionButtonBuilder,

            ),
          ),
          ElevatedButton(
              onPressed: (){
                storage.setItem('pacient', pacient.toJSONEncodable());
              },
              child:Text("Nova Pastilla")
          ),


          ElevatedButton(
            onPressed: (){
              storage.setItem('pacient', pacient.toJSONEncodable());
            },
            child:Text("Save")
          ),
          ElevatedButton(
              onPressed: (){
                 var pacientStorage = storage.getItem('pacient') ;

                 print(pacientStorage['name']);

                 print(pacientStorage['pills']);

                 pacientStorage['name']="Ester";

                 storage.setItem('pacient',pacientStorage);













              },
              child:Text("Get ITEM")
          )



        ],
      ),


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


