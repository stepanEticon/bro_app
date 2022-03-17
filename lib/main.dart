import 'package:bro_app/drawer_widget.dart';
import 'package:bro_app/object_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
        App()
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("Карта Тусур"),
        //     centerTitle: true,
        //   ),
        //   body: bodyClass(),
        // )
    );
  }
//конец класса MyApp
}

class bodyClass extends StatefulWidget {

  @override
  _bodyClass createState() => _bodyClass();
}

class _bodyClass extends State<bodyClass>{

  String _typeObject = '';

  @override
  Widget build(BuildContext context)
  {
    return
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Stack(
          children: [
            Center(
              child: Text(_typeObject),
            ),

            Align(alignment: Alignment.bottomRight,
              child: Container(
                  height: 50,
                  width: 70,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_up, size: 64.0),


                      onPressed:() {
                        _typeObject = '';
                        setState(() {

                        });

                        showModalBottomSheet(context: context,
                            builder: (BuildContext context) {
                              return
                                Container(
                                  height: 200,
                                  color: Colors.white,
                                  child: menuCategory(),
                                );

                            });

                      },
                    ),
                  )

              ),
            )
          ],
        ),
      );
  }





  Widget menuCategory(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Row( //1-ый ряд
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.white,
                                child: jorneySwitchText(),
                              );
                            });
                      },
                    ),
                    Text("Путешествие")
                  ],
                ),
              ),


              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.white,
                                child: tusurSwitchText(),
                              );
                            });
                      },
                    ),
                    Text("ТУСУР")
                  ],
                ),
              ),


            ],
          ),



          Row(//2-ой ряд
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.white,
                                child: foodSwitchText(),
                              );
                            });
                      },
                    ),
                    Text("Вкусно покушать")
                  ],
                ),
              ),


              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.white,
                                child: restSwitchText(),
                              );
                            });
                      },
                    ),
                    Text("Отдых")


                  ],
                ),
              ),



            ],
          ),



        ],
      ),
    );
  }







  Widget foodSwitchText(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [


            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add
              ),
                    onPressed: () {

                      Navigator.pop(context);
                      _typeObject = "Около общежитий";
                      setState(() {

                      });
                    },
                  ),
                  Text("Возле общежитий")
                ],
              ),
            ),



            Container(
              width: 130,
              child: Column(

                children: [
                  IconButton(
                    icon: Icon(
                        Icons.add
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _typeObject = "Около корпусов";
                      setState(() {

                      });
                    },
                  ),
                  Text("Возле корпусов"),

                ],
              ),
            ),



          ],

        )

      ],
    );
  }






  Widget tusurSwitchText(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row( //1-ый ряд
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
              Icons.add
              ),
                    onPressed: () {
                      Navigator.pop(context);
                      _typeObject = "Корпус";
                      setState(() {

                      });
                    },
                  ),
                  Text("Корпуса ТУСУРа")
                ],
              ),
            ),


            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                Icons.add
                ),
                    onPressed: () {
                      Navigator.pop(context);
                      _typeObject = "Клуб по интересам";
                      setState(() {

                      });
                    },
                  ),
                  Text("По интересам")
                ],
              ),
            ),


            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                    Icons.add
                    ),

                    onPressed: () {

                      Navigator.pop(context);
                      _typeObject = "Общежитие";
                      setState(() {

                      });
                    },
                  ),
                  Text("Общежития")
                ],
              ),
            ),

          ],
        ),


        Row( //2-ой ряд
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
    Icons.add
    ),
                    onPressed: () {
                      _typeObject= "Спортивный клуб";
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                  ),
                  Text("Спорт клубы")
                ],
              ),
            ),


            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                    Icons.add
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _typeObject = 'Студенческие отряды';
                      setState(() {

                      });
                    },
                  ),
                  Text("Студ отряды")
                ],
              ),
            ),

          ],
        ),
      ],
    );
  }






  Widget restSwitchText(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [


            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
              Icons.add
              ),
                    onPressed: () {
                      _typeObject = 'Парк';
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                  ),
                  Text("Парки")
                ],
              ),
            ),



            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                Icons.add
                ),
                    onPressed: () {
                      _typeObject = 'Кинотеатр';
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                  ),
                  Text("Кинотеатры")
                ],
              ),
            ),



            Container(
              width: 130,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                    Icons.add
                    ),
                    onPressed: () {
                      _typeObject = 'Музей';
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                  ),
                  Text("Музеи")
                ],
              ),
            ),



          ],
        ),

      ],
    );
  }







  Widget jorneySwitchText(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        _typeObject = 'Памятник';
                        Navigator.pop(context);
                        setState(() {

                        });
                      },
                    ),
                    Text("Памятники")
                  ],
                ),
              ),



              Container(
                width: 130,
                child: Column(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icon/plus.png"),
                      ),
                      onPressed: () {
                        _typeObject = 'Архитектура';
                        Navigator.pop(context);

                        setState(() {

                        });

                      },
                    ),
                    Text("Деревянные дома")
                  ],
                ),
              ),

            ],
          )

        ],
      ),
    );
  }//конец jorneySwitchText

}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    readCSV();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Карта ТУСУР"),
      ),
      body: Container(),
      drawer: DrawerWidget(),
    );
  }
}
