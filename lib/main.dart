import 'package:flutter/material.dart';
import 'package:infraero/pages/aeroporto/lista_aeroportos.dart';
import 'package:infraero/pages/voo/detalhes_voo.dart';
import 'package:infraero/pages/voo/lista_voos.dart';
import 'pages/config/config.dart';

void main() {
  //Starta Thread principal
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Infraero',
        home:HomeScreen(),
      )
  );
}

