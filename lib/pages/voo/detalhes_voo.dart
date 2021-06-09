import 'package:flutter/material.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';

class DetalhesVoo extends StatelessWidget {
  final Voo voo;
  DetalhesVoo({required this.voo});

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
                            child:Text("Detalhes", style: AppTextStyles.titleBlue,))],
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
                            Padding(padding: EdgeInsets.only(top: 15),),
                            Padding(padding: EdgeInsets.only(right: 275),
                                child:Text("Destino", style: AppTextStyles.detalhesTitle,)),
                            Container(
                                height: 50, width: 340,
                                child:Card(
                                    semanticContainer: true,
                                    child: ListTile(
                                        title: Padding(padding: EdgeInsets.only(bottom: 20),
                                        child: Text(voo.getDestino, style: AppTextStyles.detalhes,)
                                )))),
                            Padding(padding: EdgeInsets.only(top: 10),),
                            Padding(padding: EdgeInsets.only(right: 230),
                                child:Text("Data - Horário", style: AppTextStyles.detalhesTitle,)),
                            Container(
                                height: 50, width: 340,
                                child:Card(
                                    semanticContainer: true,
                                    child: ListTile(
                                        title: Padding(padding: EdgeInsets.only(bottom: 20),
                                            child: Text(voo.getData, style: AppTextStyles.detalhes,)
                                        )))),
                            Padding(padding: EdgeInsets.only(top: 10),),
                            Padding(padding: EdgeInsets.only(right: 250),
                                child:Text("Companhia", style: AppTextStyles.detalhesTitle,)),
                            Container(
                                height: 50, width: 340,
                                child:Card(
                                    semanticContainer: true,
                                    child: ListTile(
                                        title: Padding(padding: EdgeInsets.only(bottom: 20),
                                            child: Text(voo.getCompanhia.toString(), style: AppTextStyles.detalhes,)
                                        )))),
                            Padding(padding: EdgeInsets.only(top: 10),),
                            Padding(padding: EdgeInsets.only(right: 275),
                                child:Text("Numero", style: AppTextStyles.detalhesTitle,)),
                            Container(
                                height: 50, width: 340,
                                child:Card(
                                    semanticContainer: true,
                                    child: ListTile(
                                        title: Padding(padding: EdgeInsets.only(bottom: 20),
                                            child: Text(voo.getNumeroVoo.toString(), style: AppTextStyles.detalhes,)
                                        )))),Padding(padding: EdgeInsets.only(top: 10),),
                            Padding(padding: EdgeInsets.only(right: 190),
                                child:Text("Portão de embarque", style: AppTextStyles.detalhesTitle,)),
                            Container(
                                height: 50, width: 340,
                                child:Card(
                                    semanticContainer: true,
                                    child: ListTile(
                                        title: Padding(padding: EdgeInsets.only(bottom: 20),
                                            child: Text(voo.getPortaoEmbarque, style: AppTextStyles.detalhes,)
                                        ))))
                          ]
                      )
                  )]
            )));
  }
}
