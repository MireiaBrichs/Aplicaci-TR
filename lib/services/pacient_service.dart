import 'dart:convert';

import 'package:app_tr/models/pacient.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PacientService with ChangeNotifier{

  Pacient? pacient;
  List<String>? pills;


  recoverInfoPacient() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var pacientString = prefs.getString("pacient");
    var pillsString =prefs.getStringList("pills");

    if(pacientString !=null && pillsString!=null){
      //Vol dir que ja tenim un pacient i hem de recuperar les dades

      //Decodifiquem el pacient per terni-lo com a objecte
      Map<String,dynamic> pacientDecoded = jsonDecode(pacientString);

      pacient = Pacient(pacientDecoded['name'],pacientDecoded['age']);


      pills = prefs.getStringList("pills");


    }else{
      pacient = Pacient("Pacient Nou","17");

      prefs.setString("pacient", jsonEncode(
          {
            "name": "Pacient Nou",
            "age": "17",
          }
      ));

      pills=[];
      prefs.setStringList('pills', pills!);


    }


  }

  afegirMedicament(){


  }

  eliminarMedicament(){


  }

  editarMedicament(){



  }













}

