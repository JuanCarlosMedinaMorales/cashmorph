import 'package:cashmorph/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    _closeSplash();
    super.initState();
  }
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
          ),
          Center(
            child: Image(
              image: AssetImage("assets/images/Carga.png"),
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _closeSplash() async{
    Future.delayed(const Duration(seconds: 2),() async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }
}
