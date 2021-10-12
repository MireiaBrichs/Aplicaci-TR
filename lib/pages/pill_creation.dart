import 'package:MedsRemainder/models/pacient.dart';
import 'package:MedsRemainder/services/pacient_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

class PillCreation extends StatefulWidget {
  const PillCreation({Key? key}) : super(key: key);

  @override
  State<PillCreation> createState() => _SecondRoute();
}

class _SecondRoute extends State<PillCreation> {
  // var to store
  // onChanged callback
  late String title;
  String text = "medicament 1";

  final namePillController = TextEditingController();

  // NombrePastilles? _character = NombrePastilles.una;

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('APPTR');

    //TODO: hem de buscar la info de la pastilla que ens passen per arguments

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: TextFields(),
    );
  }
}

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  TextFieldsState createState() {
    return TextFieldsState();
  }
}

class TextFieldsState extends State<TextFields> {
  final _formKey = GlobalKey<FormState>();

  final namePillController = TextEditingController();
  final numberPillController = TextEditingController();
  final hoursPillController = TextEditingController();
  final daysPillController = TextEditingController();
  DateTime pickDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Text(
              'Introdueix el nom del medicament:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              controller: namePillController,
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
                hintText: "Hola mireia",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Text(
              'Introdueix el nombre de pastilles(1 - 4):',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              controller: numberPillController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Omple aquest camp';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Text(
              'Introdueix cada quantes hores:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              controller: hoursPillController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Omple aquest camp';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Text(
              'Introdueix durant quants dies has de pendre el medicament:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              controller: daysPillController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Omple aquest camp';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            height: 90,
            child: ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true,
                    onConfirm: (date) {
                  pickDate = date;
                }, currentTime: DateTime(2021, 9, 1, 00, 00));
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Prem per triar la primera presa',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[100],
                  side: BorderSide(color: Colors.grey)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            height: 90,
            child: ElevatedButton(
              onPressed: () async {
                //TODO: Arreglar aixo per afegri les coses amb inputs

                //TODO: Pill pastilleta = Pill(namePillController.text,"2","8","60",DateTime.now());

                if (_formKey.currentState!.validate()) {
                  PacientService instance =
                      Provider.of<PacientService>(context, listen: false);

                  await instance.afegirMedicament(
                      namePillController.text,
                      numberPillController.text,
                      hoursPillController.text,
                      daysPillController.text,
                      pickDate);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Guardant la informació')),
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent[200],
              ),
              child: const Text('Acceptar'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime!;
    DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}
