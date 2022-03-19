import 'dart:math';
import 'dart:developer' as dp;
import 'package:bro_app/drawer_widget.dart';
import 'package:bro_app/object_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'key_storage.dart';

Future <void> main() async {
 await   GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: App()
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

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(56.4741287, 84.9497299);
  List<ObjectModel> all = [];
  List<ObjectModel> selected = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};

  @override
  void initState() {
    //GetStorage().write(keyStorage, "");

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getData();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Карта ТУСУР"),
      ),
      body:  GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 11,
                target: _center,
              ),
              onMapCreated: _onMapCreated,
            markers: markers,
            ),
      drawer: DrawerWidget(),
    );
  }

  Future<void> getData() async {
    List<ObjectModel> allRead = await readCSV();
    dp.log(allRead.length.toString(), name:'ALLREAD');
    setState(() {
      all = allRead;
      selected = allRead;
      addMarkesr();
    });
  }

  void addMarkesr() {
    markers.clear();
    selected.forEach((element) {
      markers.add(
        Marker(
          markerId: MarkerId(
            Random().nextInt(10000000).toString(),
          ),
          position: LatLng(element.lat ?? 0, element.lon ?? 0)
        ),
      );
    });

    GetStorage().listenKey(keyStorage, (value) {
      setState(() {
        //selected = [];
        for (var element in all) {
          if (element.typeObject == value) {
            selected.add(element);
          }
        }
        addMarkesr();
      });
    });
  }
}
