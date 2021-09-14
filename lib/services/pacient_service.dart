import 'dart:convert';

import 'package:app_tr/models/pacient.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PacientService with ChangeNotifier{

  Pacient? pacient;
  List<String>? pills;


 Future<void> recoverInfoPacient() async{
   print("Recovering Info");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? pacientString = prefs.getString("pacient");
    List<String>? pillsString =prefs.getStringList("pills");

    if(pacientString !=null && pillsString!=null){
      print("Pacient already created, recovering info");
      //Vol dir que ja tenim un pacient i hem de recuperar les dades

      //Decodifiquem el pacient per terni-lo com a objecte
      Map<String,dynamic> pacientDecoded = jsonDecode(pacientString);

      pacient = Pacient(pacientDecoded['name'],pacientDecoded['age']);


      pills = prefs.getStringList("pills");


    }else{
      print("Pacient not created, creating new User on our mobile phone...");
      pacient = Pacient("Pacient 2","17");

      prefs.setString("pacient", jsonEncode(
          {
            "name": "Pacient 2",
            "age": "17",
          }
      ));

      pills=[];
      prefs.setStringList('pills', pills!);


    }


  }
  editPacient(Pacient pacient){



  }

  afegirMedicament(Pill pastilleta){






   notifyListeners();


  }

  eliminarMedicament(String nom){


  }

  editarMedicament(Pill pastilleta){



  }













}

