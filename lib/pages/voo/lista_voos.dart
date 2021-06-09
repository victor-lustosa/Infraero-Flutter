import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_aeroporto.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_voo.dart';

import 'detalhes_voo.dart';

class ListaVoos extends StatelessWidget {
  final List<Voo> voo;
  ListaVoos({required this.voo});
  void avancar(BuildContext context, int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesVoo(voo: voo[index]),));
  }
  @override
  Widget build (BuildContext context) {
      return Scaffold(
          appBar:
          PreferredSize(
              preferredSize: Size.fromHeight(115),
              child: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children:<Widget>[
                          Padding(padding: EdgeInsets.only(top: 22),
                              child:Text("Voos", style: AppTextStyles.titleBlue,))],
                        mainAxisAlignment: MainAxisAlignment.center,)
                      ,],))),
          body: SafeArea(
              child:  PageView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget> [
                    Container(
                        decoration: BoxDecoration(gradient: AppGradients.linear),
                        child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 30),),
                              Expanded(
                                  child: SizedBox(
                                      child: ListView.builder(
                                          itemCount: voo.length , itemBuilder: (context,index) {
                                        return BlocoListaVoo(
                                            voo: voo[index],
                                            onTap: () {
                                              avancar(context,index);})
                                        ;})))]))
                  ]
              )
          )
      );
    }
  }
