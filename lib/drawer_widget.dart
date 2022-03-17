import 'dart:core';

import 'package:bro_app/category.dart';
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
  List<String> travel = [
    "Памятники",
    "Деревянные дома"
  ];
  List<String> tusur = [
    "Корпуса ТУСУР",
    "Общежития",
    "Студ отряды",
    "По интересам",
    "Спорт клубы"
  ];
  List<String> eat = [
    "Возле общежитий",
    "Возле корпусов"
  ];
  List<String> dosug = [
    'Парки'
  ];
   late List<List<String>> subcategories;
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
