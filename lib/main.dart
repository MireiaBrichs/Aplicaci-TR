import 'package:MedsRemainder/pages/first_page.dart';
import 'package:MedsRemainder/pages/pacient_edition.dart';
import 'package:MedsRemainder/pages/pill_creation.dart';
import 'package:MedsRemainder/services/pacient_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/bluetooth_page.dart';


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




