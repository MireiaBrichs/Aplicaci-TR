
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
        title: const Text('editar perfil',
          style: TextStyle(
              fontSize: 30,
          ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey [900],
      ),
      body: TextFieldsPacient(),
    );
  }
}
class TextFieldsPacient extends StatefulWidget {
  const TextFieldsPacient ({Key? key}) : super(key: key);

  @override
  TextFieldsPacientState createState() {
    return TextFieldsPacientState();
  }
}

class TextFieldsPacientState extends State<TextFieldsPacient> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const Text('Introdueix el teu nom:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: TextFormField(
                //controller: namePillController,
                // onChanged: (String value) async {
                //   title = value;
                // },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Omple aquest camp';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),

              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const Text('Introdueix la teva edat:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: TextFormField(
                //controller: namePillController,
                // onChanged: (String value) async {
                //   title = value;
                // },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Omple aquest camp';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,30,10,0),
              height: 90,
              child: ElevatedButton(
                onPressed: () {

                  //TODO: Arreglar aixo per afegri les coses amb inputs

                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Guardant la informació')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent [200],
                ),
                child: const Text('Acceptar'),
              ),
            ),
          ]
      ),
    );
  }
}