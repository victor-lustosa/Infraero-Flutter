import 'package:flutter/material.dart';
import 'package:infraero/pages/aeroporto/home_aeroporto.dart';
import 'package:infraero/pages/aeroporto/lista_aeroportos.dart';
import 'package:infraero/pages/config/app_routes.dart';
import 'package:infraero/pages/voo/detalhes_voo.dart';
import 'package:infraero/pages/voo/lista_voos.dart';
import 'pages/config/config.dart';

void main() {
  //Starta Thread principal
  runApp(MaterialApp(
    title: 'Infraero',
    home:HomeScreen(),
    initialRoute: "/",
    routes: {
      AppRoutes.LISTA_AEROPORTOS : (context) => ListaAeroportos(),
      AppRoutes.LISTA_VOOS : (context) => ListaVoos(),
      AppRoutes.DETALHES_VOO: (context) => DetalhesVoo(),
      AppRoutes.HOME_AEROPORTO: (context) => HomeAeroporto()
    },
   )
  );
}

