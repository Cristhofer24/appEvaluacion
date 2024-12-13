import 'package:app_evaluacion/Screens/Login.dart';
import 'package:app_evaluacion/Screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: body(),
      
   
    );
  }
}

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Welcome")),
     body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the buttons vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the buttons horizontally
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: btn_login(context),
            
            ),
            btn_Registro(context)
           
          ],
     ),
     ),
     
    );
  }
}

Widget btn_login(context){
  return FilledButton(onPressed: ()=>{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()))
  },


   child: Text("Iniciar Sesión", style: TextStyle(fontSize: 18),),
   style: ButtonStyle( backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 18, 99, 220)),

   padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
    ),
   
   );
}

Widget btn_Registro(context){
  return FilledButton(onPressed: (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
  },

   child: Text("Registrate", style: TextStyle(fontSize: 18),),

   style: ButtonStyle( backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 33, 99, 221)), 

   padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 88, vertical: 15)),
   ),
   );
}