import 'package:flutter/material.dart';
import 'package:infraero/pages/infraero/home_infraero.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:"Aeroporto",
        home:HomeInfraero()
    );
  }
}