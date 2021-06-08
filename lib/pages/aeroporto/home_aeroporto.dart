import 'package:flutter/material.dart';
import 'package:infraero/models/companhia.dart';
import 'package:infraero/models/gestor_companhias.dart';
import 'package:infraero/models/infraero.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/aeroporto/lista_aeroportos.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/widgets/dropdown/dropdown_cidade.dart';
import 'package:infraero/pages/widgets/dropdown/dropdown_estado.dart';


class HomeAeroporto extends StatefulWidget {
  HomeAeroporto({Key? key}) : super(key: key);
  _HomeAeroportoState createState() => _HomeAeroportoState();
}

class _HomeAeroportoState extends State<HomeAeroporto>{
  //instancias das classes
  Infraero infra = new Infraero();
  GestorCompanhias gestComp = new GestorCompanhias();
  Aeroporto aeroporto = new Aeroporto();
  Voo voo = new Voo();
  String? valorEstado ='';
  String? valorCidade ='';
  void carregaDados(){
    // Companhia? comp1 = Companhia.with_parameters("Fly Emirates", 09786);
    // Companhia? comp2 = Companhia.with_parameters("GOL", 08769);
    // gestComp.insereCompanhia(comp1);
    // gestComp.insereCompanhia(comp2);
    // infra.insereAeroporto();
    infra.insereAeroporto(Aeroporto.with_parameters("Campo de Marte","5453345", "Palmas","Tocantins","34343"));
    infra.insereAeroporto(Aeroporto.with_parameters("Campinas/Viracopos","343234", "palmas","brasil","34545"));
  }
  carregandoListaEstado(){

  }
  void avancar(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAeroportos(aeroporto: infra.vetAeroportosCidadeEstado)));
  }
  @override
  Widget build (BuildContext context) {
    carregaDados();
    return Scaffold(
        appBar:
        PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children:<Widget>[
                        Padding(padding: EdgeInsets.only(top: 22),
                            child:Text("Localização do Aeroporto", style: AppTextStyles.titleBlue,))],
                      mainAxisAlignment: MainAxisAlignment.center,)
                    ,],))),
        body: SafeArea(
          child:  PageView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget> [
                Container(
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Column(
                      children: <Widget> [
                        Padding(padding: EdgeInsets.only(top: 50)),
                        DropDownEstado(
                              callback: (String estado){
                                setState((){
                                  infra.aeroportoPorEstado(estado);
                                });
                              },
                            ),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        DropDownCidade(
                          callback: (String cidade){
                            setState((){
                              infra.getAeroportoPorCidadeEEstado(cidade);
                            });
                          },
                        ),Padding(padding: EdgeInsets.only(top: 280)),
                        Row(children: <Widget> [
                          ElevatedButton(
                              onPressed: (){
                                avancar(context);
                              },
                              child: Text("Avançar", style: AppTextStyles.button),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 60)),
                              )),
                          Padding(padding: EdgeInsets.only(top: 42),)
                        ],
                          mainAxisAlignment: MainAxisAlignment.center, ),
                      ]
                  ),
                )
              ]
          ),
        )
    );
  }
}





