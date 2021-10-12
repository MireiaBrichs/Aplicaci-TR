import 'dart:convert';
import 'dart:typed_data';

import 'package:MedsRemainder/pages/firstPage.dart';
import 'package:MedsRemainder/pages/pacientEdition.dart';
import 'package:MedsRemainder/pages/pillCreation.dart';
import 'package:MedsRemainder/services/pacient_service.dart';
import 'package:MedsRemainder/widgets/button_edition_pill.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/pacient.dart';
import 'pages/bluetoothpage.dart';


///MAIN inicial de la aplicació
void main() async {
  //Inicialitzem el servei de pacient
  print('------------------------------Aplicaction initialazing---------------------------');
  PacientService pacient = PacientService();
  pacient.recoverInfoPacient();

  runApp(
      //Fem servir els proveïdors de info per aixi tenir la info actualitzada en la app
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PacientService(),
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //Establim les rutes que volem fer
        initialRoute: 'home',
        routes:{
          'bluethoothConection': (context) => BluetoothRoute(),
          'home':(context)=>FirstRoute(),
          'pillCreation':(context)=>PillCreation(),
          'pacientEdition':(context)=>PacientEdition()
        }, ),
    ));
}




