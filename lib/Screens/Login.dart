import 'package:app_evaluacion/Screens/Gastronomia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: [
            input_email(),
            SizedBox(height: 20), // Add some spacing between input fields and button
            input_password(),
            SizedBox(height: 20), // Add some spacing between password and button
            btn_login(context),
          ],
        ),
    )

    );
  }
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

Widget input_email() {
  return TextField(
    controller: email,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Correo Electronico',
    ),
  );
}

Widget input_password() {
  return TextField(
    controller: password,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Contraseña',
    ),
  );
}

Widget btn_login(context){
  return FilledButton(onPressed: ()=> login(email.text, password.text,context),

   child: Text("Iniciar Sesión", style: TextStyle(fontSize: 18),),
   style: ButtonStyle( backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 18, 99, 220)),

   padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
    ),
   
   );
}

Future<void> login(email,password, context) async {
  try {
  // ignore: unused_local_variable
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Gastronomia()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}