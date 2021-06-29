import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_voo.dart';
import 'detalhes_voo.dart';

class ListaVoos extends StatefulWidget {
  final Aeroporto aeroporto;

  String cidadeAero ='';
  ListaVoos({required this.aeroporto});
  @override
  _ListaVoosState createState() => _ListaVoosState();
}
class _ListaVoosState extends State<ListaVoos> {
  List<Voo> voos = [];
  void avancar(BuildContext context, int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesVoo()));
  }
  carregandoLista(){
    voos = widget.aeroporto.getVooChegada(widget.aeroporto.getCidade);
  }
  @override
  Widget build (BuildContext context) {
    if(voos.isEmpty) {
      carregandoLista();
    }
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
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 0),
                              child:Text("Voos", style: AppTextStyles.titleBlue,),
                            )],mainAxisAlignment: MainAxisAlignment.center),
                      Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top:0),
                                child: Text(widget.aeroporto.getNome, style: AppTextStyles.subtitleBlue,))
                            ,],mainAxisAlignment: MainAxisAlignment.center)]))),
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
                              Padding(padding: EdgeInsets.only(right: 55)),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    voos.clear();
                                    voos = widget.aeroporto.getVooChegada(widget.aeroporto.getCidade);
                                  });},
                                child: Text("Chegada",style: AppTextStyles.botoesListaVoo,),),
                              Padding(padding: EdgeInsets.only(left:59),
                                  child: Text("|",style: AppTextStyles.listraListaVoo,)),
                              Padding(padding: EdgeInsets.only(right: 62)),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    voos.clear();
                                    voos = widget.aeroporto.getVooSaida(widget.aeroporto.getCidade);
                                  });
                                },
                                child: Text("Saida",style: AppTextStyles.botoesListaVoo,),
                              ),
                            ],
                            ),
                            Expanded(
                                child: SizedBox(
                                    child: ListView.builder(
                                        itemCount: voos.length , itemBuilder: (context,index) {
                                      return BlocoListaVoo(
                                          voo: voos[index],
                                          onTap: () {
                                            avancar(context,index);
                                          });})))]))])));}
}
