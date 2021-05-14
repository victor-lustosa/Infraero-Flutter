import 'package:flutter/material.dart';
import 'infraero.dart';

void main()
{  //Starta Thread principal
  runApp(MaterialApp(title: 'Minha aplicacao', home: Infraero(),
    initialRoute: "/",
    routes:
    {

      // Rotas.TELA_SOBRE : (context) => TelaSobre(),
    },
  ));
}
class Rotas {
  String nome = "oi";
  static final String TELA_SOBRE = "/TelaSobre";
}


