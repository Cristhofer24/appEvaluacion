import 'package:app_evaluacion/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class Listcity extends StatelessWidget {
  const Listcity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('City'),
      ),
      drawer: MyDrawer(),
    );
  }
}