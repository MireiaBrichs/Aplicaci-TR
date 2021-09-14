class Pacient {

  String? name;
  String? age;

  List<Pill>? pills=[];

  Pacient(this.name, this.age);

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['name'] = name;
    m['age'] = age;
    m['pills']=pills!.map((e) => e.toJSONEncodable());

    return m;
  }



}

class Pill {
  String? name;
  String? number; //Quantitat
  String? periodicity; //Cada quantes hores
  String? duration;//durant quants dies

  DateTime? firstTake; //Primera data de quan l'he pres


  Pill(this.name,this.number,this.periodicity,this.duration,this.firstTake);

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['name'] = name;
    m['number'] = number;
    m['periodicity'] = name;
    m['duartion'] = number;

    return m;
  }

}
