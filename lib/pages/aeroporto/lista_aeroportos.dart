import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_aeroporto.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/voo/lista_voos.dart';
class ListaAeroportos extends StatelessWidget {
  final List<Aeroporto> aeroporto;
  ListaAeroportos({required this.aeroporto});

  void avancar(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListaVoos(voo: aeroporto[index].getVoos),),);
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
                            child:Text("Aeroportos", style: AppTextStyles.titleBlue,))],
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
                                        itemCount: aeroporto.length , itemBuilder: (context,index) {
                                      return BlocoListaAeroporto(
                                          aeroporto: aeroporto[index],
                                          onTap: () {
                                            avancar(context,index);
                                          });})))]))
                ]
            )
        )
    );
  }
}
