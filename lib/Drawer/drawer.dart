
import 'package:app_evaluacion/Screens/Gastronomia.dart';
import 'package:app_evaluacion/Screens/ListCity.dart';
import 'package:app_evaluacion/Screens/Login.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        children: [
          ListTile(
            title: Text("Listar Ciudades"),
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> Listcity())),
          ),
          ListTile(
            title: Text("Log out"),
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> Login())),
          ),
             ListTile(
            title: Text("Gatronomia"),
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> Gastronomia())),
          ),
        
        
        ]
      ),
    );
  }
}