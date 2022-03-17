import 'package:flutter/material.dart';


class Subcategory extends StatefulWidget {
  String subcategory;
   Subcategory({Key? key, required this.subcategory}) : super(key: key);

  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15
      ),
      child: Text(widget.subcategory, textAlign: TextAlign.start,),
    );
  }
}
