import 'package:flutter/material.dart';

enum NombrePastilles { una, dues, tres, quatre }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  NombrePastilles? _character = NombrePastilles.una;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}