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

  Double ValorTotal = 0 as Double;
  String _opcion1 = 'Peso Colombiano';
  String _opcion2 = 'Dolar';
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();


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
              padding: const EdgeInsets.all(20),
              child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image(
                     image: AssetImage("assets/images/Cam.png"),
                     width: 200,
                     height: 200,
                   ),
                   SizedBox(height: 16,),
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
                   Row(
                     children: [
                       Expanded(
                           child: TextFormField(
                             controller: _numero1,
                             decoration: const InputDecoration(
                               border: OutlineInputBorder(),
                               labelText: "Valor de moneda 1",
                               prefixIcon: Icon(Icons.money),
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
                           ),// Primer valor
                       ),
                       SizedBox(width: 16,),
                       Expanded(
                           child: TextFormField(
                             controller: _numero2,
                             decoration: const InputDecoration(
                               border: OutlineInputBorder(),
                               labelText: "Valor de moneda 2",
                               prefixIcon: Icon(Icons.money),
                             ),
                             keyboardType: TextInputType.number,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: (value) {
                               if (value!.isEmpty){
                                 return "Debe digitar un valor a convertir valido";
                               } else{
                                 if (!value!.isValidNumber()){ //verifica si el valor solo tiene numeros
                                   return "Valor no valido de ${_opcion2}";
                                 }
                               }
                               return null;

                             },
                           ),// Segundo valor
                       ),
                     ],
                   ),//ingraser los valores
                   SizedBox(height: 20,),
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
                       onPressed:(){
                         _onConverterButtonClicked();
                       },
                       child: const Text("Calcular")
                   ),
                   SizedBox(height: 20,),
                   Text(
                     "El total es $ValorTotal",
                     style: const TextStyle(
                         fontSize: 20,
                         fontStyle: FontStyle.italic,
                         color: Colors.white
                     ),
                   ),

                 ],
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
  void dropdownCallback2 (String? selectedValue){
    if (selectedValue is String){
      setState((){
        _opcion2 = selectedValue;
      });
    }
  }
  void _onConverterButtonClicked(){
    if(_opcion1=="Peso Colombiano" && _opcion2=="Dolar"){
      ValorTotal= (4309.76 * double.parse(_numero2.text)) as Double;
    } else if(_opcion1=="Peso Colombiano" && _opcion2=="Euro"){
      ValorTotal=4911.41 * (double.parse(_numero2.text)) as Double;
    }else if(_opcion1=="Peso Colombiano" && _opcion2=="Yen"){
      ValorTotal=30.3159 * (double.parse(_numero2.text)) as Double;
    }else if(_opcion1=="Dolar" && _opcion2=="Peso Colombiano"){
      ValorTotal=4309.76 * (double.parse(_numero1.text)) as Double;
    }else if(_opcion1=="Dolar" && _opcion2=="Euro"){
      ValorTotal=1.1395 * (double.parse(_numero2.text)) as Double;
    }else if(_opcion1=="Dolar" && _opcion2=="Yen"){
      ValorTotal=0.0070339 * (double.parse(_numero2.text)) as Double;
    }else if(_opcion1=="Euro" && _opcion2=="Peso Colombiano"){
      ValorTotal=4911.41 * (double.parse(_numero1.text)) as Double;
    }else if(_opcion1=="Euro" && _opcion2=="Dolar"){
      ValorTotal=1.1395 * (double.parse(_numero1.text)) as Double;
    }else if(_opcion1=="Euro" && _opcion2=="Yen"){
      ValorTotal=0.0061728 * (double.parse(_numero2.text)) as Double;
    }else if(_opcion1=="Yen" && _opcion2=="Peso Colombiano"){
      ValorTotal=30.3159 * (double.parse(_numero1.text)) as Double;
    }else if(_opcion1=="Yen" && _opcion2=="Dolar"){
      ValorTotal=0.0070339 * (double.parse(_numero1.text)) as Double;
    }else if(_opcion1=="Yen" && _opcion2=="Euro"){
      ValorTotal=0.0061728 * (double.parse(_numero1.text)) as Double;
    } else{
      ValorTotal=0 as Double ;
    }

  }
}


extension on String{
  bool isValidNumber(){
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}
