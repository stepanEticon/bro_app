import 'package:bro_app/key_storage.dart';
import 'package:bro_app/sub_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class Subcategory extends StatefulWidget {
  SubModel subcategory;
   Subcategory({Key? key, required this.subcategory}) : super(key: key);

  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        GetStorage().write(keyStorage, widget.subcategory.typeObject);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 30
        ),
        child: Text(widget.subcategory.title!, textAlign: TextAlign.start,),
      ),
    );
  }
}
