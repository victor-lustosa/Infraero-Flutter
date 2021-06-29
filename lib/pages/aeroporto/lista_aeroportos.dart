import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/widgets/blocos/bloco_lista_aeroporto.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/pages/voo/lista_voos.dart';
import 'package:http/http.dart' as http;
class ListaAeroportos extends StatefulWidget {
  String cidade;
  String estado;

  ListaAeroportos({required this.cidade, required this.estado});

  _ListaAeroportosState createState() => _ListaAeroportosState();
}
class _ListaAeroportosState extends State<ListaAeroportos>{


  List<Aeroporto> listaAeroporto =[];
  Future<List<Aeroporto>> buscaAllDados() async {
    var response = await http.get(Uri.parse('https://my-json-server.typicode.com/ferpalma/fakeapi-testes/aerorporto'));
    List<dynamic>  lista = json.decode(response.body);
    listaAeroporto = lista.map((model) => Aeroporto.with_JSON(model)).toList();
    return listaAeroporto;
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
                                    child: FutureBuilder<List<Aeroporto>>(
                                    future:buscaAllDados(),
                                        initialData: [],
                                    builder: (context, AsyncSnapshot<List<Aeroporto>> snapshot){
                                      final List<Aeroporto>? aeroportos = snapshot.data;

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
                                             return BlocoListaAeroporto(
                                                aeroporto: aeroportos![index],
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListaVoos(aeroporto:aeroportos[index]),),);
                                                });}
                                          );
                                          break;
                                      }
                                      return Text('Unkown error');
                                    })))]))])));
  }
}
