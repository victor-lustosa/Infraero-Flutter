import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/aeroporto/home_aeroporto.dart';

class DropDown extends State<HomeAeroporto> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return null;
  //   return DropdownButton<String>(
  //     value: dropdownValue,
  //     icon: const Icon(Icons.arrow_downward),
  //     iconSize: 24,
  //     elevation: 16,
  //     style: const TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       height: 2,
  //       color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownValue = newValue!;
  //       });
  //     },
  //     items: <String>['One', 'Two', 'Free', 'Four']
  //         .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  }
}