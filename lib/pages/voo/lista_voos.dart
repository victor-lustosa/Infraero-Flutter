import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_aeroporto.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_voo.dart';

import 'detalhes_voo.dart';

class ListaVoos extends StatelessWidget {
  final Aeroporto aeroporto;
  ListaVoos({required this.aeroporto});
  void avancar(BuildContext context, int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesVoo(voo: aeroporto.getVoos[index]),));
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
                    Padding(padding: EdgeInsets.only(top: 10),
                      child:Text("Voos", style: AppTextStyles.titleBlue,),
                    ),
                    Padding(padding: EdgeInsets.all(0),
                        child: Text(aeroporto.getNome, style: AppTextStyles.subtitleBlue,))
                    ,],))),
        body: SafeArea(
            child:  PageView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget> [
                  Container(
                      decoration: BoxDecoration(gradient: AppGradients.linear),
                      child: Column(
                          children: <Widget>[
                            Row(children: <Widget>
                            [
                              Padding(padding: EdgeInsets.only(right: 60)),
                              TextButton(

                                onPressed: null,
                                child: Text("Chegada",style: AppTextStyles.botoesListaVoo,),),
                              Padding(padding: EdgeInsets.only(left:57),
                                  child: Text("|",style: AppTextStyles.listraListaVoo,)),
                              Padding(padding: EdgeInsets.only(right: 60)),
                              TextButton(onPressed:null, child: Text("Saida",style: AppTextStyles.botoesListaVoo,),
                              ),
                            ],
                            ),
                            Expanded(
                                child: SizedBox(
                                    child: ListView.builder(
                                        itemCount: aeroporto.getVoos.length , itemBuilder: (context,index) {
                                      return BlocoListaVoo(
                                          voo: aeroporto.getVoos[index],
                                          onTap: () {
                                            avancar(context,index);
                                          });})))]))])));}
}
