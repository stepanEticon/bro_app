import 'dart:core';

import 'package:bro_app/category.dart';
import 'package:bro_app/sub_model.dart';
import 'package:flutter/material.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}


class _DrawerWidgetState extends State<DrawerWidget> {
  List<String> categories = [
    "Путешествие",
    "ТУСУР",
    "Вкусно покушать",
    "Отдых",
  ];
  List<SubModel> travel = [
    SubModel(title: "Памятники", typeObject: "Памятник"),
    SubModel(title: "Деревянные дома", typeObject: "Архитектура"),
  ];
  List<SubModel> tusur = [
    SubModel(title:  "Корпуса ТУСУР", typeObject: "Корпус"),
    SubModel(title: "Общежития", typeObject: "Общежитие"),
    SubModel(title: "Студ отряды", typeObject: "Студенческие отряды"),
    SubModel(title: "По интересам", typeObject: "Клуб по интересам"),
    SubModel(title: "Спорт клубы", typeObject: "Спортивный клуб"),

  ];
  List<SubModel> eat = [
    SubModel(title:  "Возле общежитий", typeObject: "Около общежитий"),
    SubModel(title:"Возле корпусов", typeObject: "Общепит"),
  ];
  List<SubModel> dosug = [
    SubModel(title: "Парки", typeObject: "Парк"),
    SubModel(title: "Кинотеатры", typeObject: "Кинотеатр"),
    SubModel(title: "Театры", typeObject: "Театр"),
    SubModel(title: "Музеи", typeObject: "Музей"),

  ];
   late List<List<SubModel>> subcategories;
  @override
  void initState() {
    subcategories = [
      travel,
      tusur,
      eat,
      dosug
    ];


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(categories.length, (index) =>
              Category(category: categories[index], subcategories: subcategories[index],)),
            ),
            Container(height: 1, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
