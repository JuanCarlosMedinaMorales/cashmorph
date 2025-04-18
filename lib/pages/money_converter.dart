import 'dart:collection';

import 'package:flutter/material.dart';
const List<String> list = <String>['Peso Colombiano', 'Dolar', 'Euro', 'Yen'];
class MoneyConverter extends StatefulWidget {
  const MoneyConverter({super.key});

  @override
  State<MoneyConverter> createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  final int moneda1 = 0;
  final int moneda2 = 0;
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
              padding: const EdgeInsets.all(10),
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
                   DropdownMenuMoney(),
                 ],
               ),
              ),
          ),
        ],
      ),
    );
  }
}
class DropdownMenuMoney extends StatefulWidget {
  const DropdownMenuMoney({super.key});

  @override
  State<DropdownMenuMoney> createState() => _DropdownMenuMoneyState();
}
typedef MenuEntry = DropdownMenuEntry<String>;
class _DropdownMenuMoneyState extends State<DropdownMenuMoney> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  ); //se convierte las entradas string a dropdown y se restringe para que no se modifique
  String dropdownValue = list.first; // valor actual seleccionado

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}