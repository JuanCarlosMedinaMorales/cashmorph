import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
const List<String> list = <String>['Peso Colombiano', 'Dolar', 'Euro', 'Yen'];
class MoneyConverter extends StatefulWidget {
  const MoneyConverter({super.key});

  @override
  State<MoneyConverter> createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {

  double ValorTotal = 0.0;
  String _opcion1 = 'Yen';
  String _opcion2 = 'Dolar';
  String _moneda = "Moneda";
  final _numero1 = TextEditingController();


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
              padding: const EdgeInsets.all(35),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/Cam.png"),
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 1,),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              items: const[
                                DropdownMenuItem(child: Text("Peso Colombiano"), value: "Peso Colombiano",),
                                DropdownMenuItem(child: Text("Dolar"), value: "Dolar",),
                                DropdownMenuItem(child: Text("Euro"), value: "Euro",),
                                DropdownMenuItem(child: Text("Yen"), value: "Yen",),
                              ],
                              value: _opcion1,
                              onChanged: dropdownCallback,
                              iconEnabledColor: Colors.yellow,
                              dropdownColor: Colors.black45,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),

                            ),
                          ),
                          Expanded(
                            child: DropdownButton(
                              items: const[
                                DropdownMenuItem(child: Text("Peso Colombiano"), value: "Peso Colombiano",),
                                DropdownMenuItem(child: Text("Dolar"), value: "Dolar",),
                                DropdownMenuItem(child: Text("Euro"), value: "Euro",),
                                DropdownMenuItem(child: Text("Yen"), value: "Yen",),
                              ],
                              value: _opcion2,
                              onChanged: dropdownCallback2,
                              iconEnabledColor: Colors.yellow,
                              dropdownColor: Colors.black45,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),

                            ),
                          ),
                        ],
                      ),//seleccionar el tipo de moneda
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _numero1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Valor de la moneda a convertir",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.monetization_on),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Debe digitar un valor a convertir valido";
                          } else{
                            if (!value!.isValidNumber()){ //verifica si el valor solo tiene numeros
                              return "Valor no valido de ${_opcion1}";
                            }
                          }
                          return null;

                        },
                      ),// Valor a convertir
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize:20,
                                fontStyle: FontStyle.italic,
                                color: Colors.black
                            ),
                            backgroundColor: Color(0xFFFFD700), // Color oro
                            elevation: 20,
                          ),
                          onPressed:(){
                            _onConverterButtonClicked();
                          },
                          child: const Text("Calcular")
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "El valor en $_moneda actual es $ValorTotal",
                        style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white
                        ),
                      ), // el valor convertido
                      SizedBox(height: 90,),

                    ],
                  ),
                ),
              ),
          ),
        ],

      ),

    );
  }
  void dropdownCallback (String? selectedValue){
    if (selectedValue is String){
      setState((){
        _opcion1 = selectedValue;
      });
    }
  }//cambia el valor seleccionado para la moneda
  void dropdownCallback2 (String? selectedValue2){
    if (selectedValue2 is String){
      setState((){
        _opcion2 = selectedValue2;
      });
    }
  }
  double _onConverterButtonClicked(){
    _moneda=_opcion2;
    if(_opcion1=="Peso Colombiano" && _opcion2=="Dolar"){
      setState(() {
        ValorTotal= double.parse(_numero1.text) / 4309.76;
      });

    } else if(_opcion1=="Peso Colombiano" && _opcion2=="Euro"){
      setState(() {
        ValorTotal= double.parse(_numero1.text)/ 4911.41;
      });

    }else if(_opcion1=="Peso Colombiano" && _opcion2=="Yen"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 30.3159;
      });
    }else if(_opcion1=="Dolar" && _opcion2=="Peso Colombiano"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 4309.76;
      });

    }else if(_opcion1=="Dolar" && _opcion2=="Euro"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 1.1395;
      });
    }else if(_opcion1=="Dolar" && _opcion2=="Yen"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 0.0070339;
      });
    }else if(_opcion1=="Euro" && _opcion2=="Peso Colombiano"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 4911.41;
      });
    }else if(_opcion1=="Euro" && _opcion2=="Dolar"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 1.1395;
      });
    }else if(_opcion1=="Euro" && _opcion2=="Yen"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 0.0061728;
      });
    }else if(_opcion1=="Yen" && _opcion2=="Peso Colombiano"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 30.3159;
      });
    }else if(_opcion1=="Yen" && _opcion2=="Dolar"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 0.0070339;
      });
    }else if(_opcion1=="Yen" && _opcion2=="Euro"){
      setState(() {
        ValorTotal=double.parse(_numero1.text) / 0.0061728;
      });
    } else{
      setState(() {
        ValorTotal=0.0;
      });
    }
    return ValorTotal;

  }
}


extension on String{
  bool isValidNumber(){
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}
