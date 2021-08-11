class Pacient {

  String? name;
  String? age;
  List<Pill>? pills=[];

  Pacient(this.name, this.age, this.pills);

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
  String? number;
  List<Days>? hours;

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['name'] = name;
    m['number'] = number;

    return m;
  }

}
class Days {
  String? name;
  List<DateTime>? tomes;

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['name'] = name;
    m['tomes'] = tomes;

    return m;
  }






}