import 'dart:convert';

import 'package:MedsRemainder/models/pacient.dart';
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
      pacient = Pacient("Pacient Nou"," ");

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
  Future<void> editInfoPacient (String name, String age) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("pacient",jsonEncode(
        {
          "name": name,
          "age": age,
        }
    ));

    print("Saving info edition Pacient");
    pacient = Pacient(name,age);

    notifyListeners();
    return;

  }

  Future<void> afegirMedicament (String name, String number, String hours, String days, DateTime firstTake) async {


   SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String>? pillsString =prefs.getStringList("pills");

   pillsString!.add(jsonEncode({

     "name": name,
     "number": number,
     "hours": hours,
     "days": days,
     "firstTake": firstTake.toString(),

   }));


   pills = pillsString;

    await prefs.setStringList("pills",pillsString);

    print("New Pill added");

    notifyListeners();
    return;

  }

  Future<void> eliminarMedicament(int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? pillsString =prefs.getStringList("pills");

    pillsString!.removeAt(index);

    pills = pillsString;

    await prefs.setStringList("pills",pillsString);

    print("Pill deleted");

    notifyListeners();
    return;


  }

  editarMedicament(){



  }













}

