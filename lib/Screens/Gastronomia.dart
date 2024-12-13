import 'package:app_evaluacion/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class Gastronomia extends StatelessWidget {
  const Gastronomia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gastronomia")),
     body:  Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: [
            Text("Ingrese su plato"),
            input_idPlato(),
            SizedBox(height: 20), // Add some spacing between input fields and button
            input_Plato(),
            SizedBox(height: 20), // Add some spacing between password and button
            input_city(),
            SizedBox(height: 20),
            btn_Gastronomia(context)
          ],
        ),
    ),
    drawer: MyDrawer(),
    );
  }
}

TextEditingController idPlato = TextEditingController();
TextEditingController Plato = TextEditingController();
TextEditingController city = TextEditingController();

Widget input_idPlato() {
  return TextField(
    controller: idPlato,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Id Plato',
    ),
  );
}
Widget input_Plato() {
  return TextField(
    controller: Plato,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Plato',
    ),
  );
}
Widget input_city() {
  return TextField(
    controller: idPlato,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Ciudad',
    ),
  );
}

Widget btn_Gastronomia(context) {
  return FilledButton(
    onPressed: () {},
    child: Text("Guardar", style: TextStyle(fontSize: 18)),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 18, 99, 220)),
      padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
    ),
  );
}