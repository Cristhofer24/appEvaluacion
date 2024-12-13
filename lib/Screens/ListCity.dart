import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app_evaluacion/Drawer/drawer.dart';

class Listcity extends StatelessWidget {
  const Listcity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listar Ciudades")),
      body: listViewExterno("https://jritsqmet.github.io/web-api/video_juegos.json"),
      drawer: MyDrawer(),
    );
  }
}

Future<List> jsonExterno(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Asegúrate de que la clave 'videojuegos' exista en el JSON
      return data['videojuegos'] ?? []; // Retorna una lista vacía si no hay 'videojuegos'
    } else {
      throw Exception("Error al cargar los datos. Código de estado: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error de conexión: $e");
  }
}

Widget listViewExterno(String url) {
  return FutureBuilder<List>(
    future: jsonExterno(url),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator()); // Muestra el indicador de carga mientras se espera
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}')); // Muestra el error si ocurre
      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              child: ListTile(
                title: Text(item['titulo'] ?? 'Título no disponible'),
                subtitle: Row(
                  children: [
                    item['imagen'] != null
                        ? Image.network(item["imagen"], width: 150, height: 150)
                        : SizedBox(), // Verifica si hay imagen antes de mostrar
                    Expanded(child: Text(item['descripcion'] ?? 'Descripción no disponible')),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Center(child: Text('No hay datos disponibles.'));
      }
    },
  );
}
