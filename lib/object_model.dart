import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
class ObjectModel {
  int? id;
  String? address;
  String? typeObject;
  String? numberMark;
  String? nameObject;
  String? description;
  double? lon;
  double? lat;

  ObjectModel(
      {this.id,
        this.address,
        this.typeObject,
        this.numberMark,
        this.nameObject,
        this.description,
        this.lon,
        this.lat});

  ObjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    typeObject = json['typeObject'];
    numberMark = json['numberMark'];
    nameObject = json['nameObject'];
    description = json['description'];
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['address'] = address;
    json['typeObject'] = typeObject;
    json['numberMark'] = numberMark;
    json['nameObject'] = nameObject;
    json['description'] = description;
    json['lon'] = lon;
    json['lat'] = lat;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

Future<List<ObjectModel>> readCSV() async {
  List<ObjectModel> obj =[];
 String data =  await   rootBundle.loadString("assets/objects.csv");
 List<List<dynamic>> rows = const CsvToListConverter().convert(data, fieldDelimiter: ";");
 rows.remove(rows.first);
 rows.forEach((elem) {
   obj.add(ObjectModel(
     id: int.tryParse(elem[7]),
     address: elem[6],
     typeObject: elem[5],
     numberMark: elem[4],
     nameObject: elem[3],
     description: elem[2],
     lon: double.tryParse(elem[1]),
     lat:double.tryParse(elem[0])
   ));
 });
 obj.forEach((element) {
   print(element.id.toString());
 });
  return obj;
}