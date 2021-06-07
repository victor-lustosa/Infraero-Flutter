import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';

class ListaVoos extends StatelessWidget {
  final Aeroporto aeroporto;
  ListaVoos({required this.aeroporto});

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
        body: SingleChildScrollView
          (
          child: Column(),)
    );
  }
}