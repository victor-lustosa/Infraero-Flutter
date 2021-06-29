import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_voo.dart';
import 'detalhes_voo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ListaVoos extends StatefulWidget {
  final Aeroporto aeroporto;


  ListaVoos({required this.aeroporto});
  @override
  _ListaVoosState createState() => _ListaVoosState();
}
class _ListaVoosState extends State<ListaVoos> {
  List<Voo> voos = [];
  late int idAeroporto;
  void avancar(BuildContext context, int index){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesVoo()));
  }
  Future<List<Voo>> buscaAllDados() async {
    idAeroporto = this.widget.aeroporto.id;
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/api/voos/${idAeroporto}'));
    List<dynamic>  lista = json.decode(response.body);
    voos = lista.map((model) => Voo.with_JSON(model)).toList();
    return voos;
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
                            Padding(padding: EdgeInsets.only(top: 30),),
                            Expanded(
                                child: SizedBox(
                                    child: FutureBuilder<List<Voo>>(
                                        future:buscaAllDados(),
                                        initialData: [],
                                        builder: (context, AsyncSnapshot<List<Voo>> snapshot){
                                          final List<Voo>? voos = snapshot.data;

                                          switch(snapshot.connectionState) {
                                            case ConnectionState.none:
                                              break;
                                            case ConnectionState.waiting:
                                              return Container(
                                                  child: Center(
                                                    child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),
                                                  ));
                                              break;
                                            case ConnectionState.active:
                                              break;
                                            case ConnectionState.done:
                                              if (!snapshot.hasData) {
                                                return Container(
                                                  child: Center(
                                                    child: CircularProgressIndicator(  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),
                                                  ),
                                                );
                                              }

                                              return ListView.builder(
                                                  itemCount:  snapshot.data!.length , itemBuilder: (context,index) {
                                                return BlocoListaVoo(
                                                    voo: voos![index],
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesVoo(voo:voos[index]),),);
                                                    });}
                                              );
                                              break;
                                          }
                                          return Text('Unkown error');
                                        })))]))])));
  }
}
