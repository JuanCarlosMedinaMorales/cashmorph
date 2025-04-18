import 'package:cashmorph/pages/money_converter.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(//imagen de fondo
            child: Image.asset(
              'assets/images/FM.png',
              fit: BoxFit.cover, //para ajustar la imagen
            ),
          ), //Fondo
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/Mon.png"),
                    width: 300,
                    height: 300,
                  ), // Logo
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize:30,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                      ),
                      backgroundColor: Color(0xFFFFD700), // Color oro
                      elevation: 20,
                    ),
                    onPressed: (){
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Iniciar"),
                  ), // Boton para iniciar la app
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
  void _onRegisterButtonClicked(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MoneyConverter(),
      ),
    );

  }
}
