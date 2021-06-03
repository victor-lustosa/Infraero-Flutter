import 'package:flutter/material.dart';
import 'package:infraero/main.dart';
import 'package:infraero/pages/aeroporto/home_aeroporto.dart';

class HomeInfraero extends StatefulWidget
{

  @override
  InfraeroState createState()
  {
    return InfraeroState();
  }
}
class InfraeroState extends State<HomeInfraero> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Calcula IMC App")),

    );
  }
}