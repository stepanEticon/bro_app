import 'dart:developer';

import 'package:bro_app/subcategory.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  String category;
  List<String> subcategories;
   Category({Key? key, required this.category,
     required this.subcategories
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  ExpandableController controller = ExpandableController();
  @override
  bool expanable = false;
  void initState() {
    controller.value = false;
    controller.addListener(() {

      setState(() {
        expanable = controller.value;
      });
      log( controller.value.toString());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      ExpandableTheme(
        data: ExpandableThemeData(hasIcon: false,
        tapHeaderToExpand: true
    ),
    child:ExpandablePanel(
      controller: controller,
      header: Container(
        child: Column(
          children: [
            Container(height: 1, color: Colors.grey,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.category),
                  Icon( expanable == false ?  Icons.arrow_drop_down : Icons.arrow_drop_up , color: Colors.grey,)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
      collapsed:   Container(),
      expanded: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(widget.subcategories.length, (index) =>
        Subcategory(subcategory: widget.subcategories[index])),
      ),

    ));
  }
}
