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
  String valorEstado ='';
  String valorCidade ='';
  void carregaDados(){
    Companhia? comp1 = Companhia.with_parameters("Fly Emirates", 09786);
    Companhia? comp2 = Companhia.with_parameters("GOL", 08769);
    gestComp.insereCompanhia(comp1);
    gestComp.insereCompanhia(comp2);
    Voo voo1 = Voo.with_parameters( "10/05/2022", "15:30", 56542, "Salvador", "Sul","Palmas");
    voo1.setCompanhia(comp1);
    Voo voo2 = Voo.with_parameters( "20/07/2021", "19:30", 23557, "Rio de Janeiro", "Noroeste","Palmas");
    voo2.setCompanhia(comp2);
    Voo voo3 = Voo.with_parameters( "10/05/2022", "14:45", 26546, "Florianópolis", "Norte","Palmas");
    voo3.setCompanhia(comp1);
    Voo sp1 = Voo.with_parameters( "10/05/2022", "15:30", 56542, "Sao paulo", "Sul","Palmas");
    sp1.setCompanhia(comp1);
    Voo sp2 = Voo.with_parameters( "20/07/2021", "19:30", 23557, "Sao paulo", "Noroeste","Palmas");
    sp2.setCompanhia(comp2);
    Voo sp3 = Voo.with_parameters( "10/05/2022", "14:45", 26546, "Sao paulo", "Norte","Palmas");
    sp3.setCompanhia(comp1);
    Voo sp4 = Voo.with_parameters( "26/05/2023", "5:30", 83673, "Sao paulo", "Noroeste","Fortaleza");
    sp4.setCompanhia(comp2);
    Voo sp5 = Voo.with_parameters( "11/05/2022", "3:45", 92948, "Sao paulo", "Sul","Fortaleza");
    sp5.setCompanhia(comp1);
    Voo sp6 = Voo.with_parameters( "25/08/2021", "17:50", 34053, "Sao paulo", "Noroeste","Fortaleza");
    sp6.setCompanhia(comp2);
    Voo voo4 = Voo.with_parameters( "26/05/2023", "5:30", 53579, "Brasília", "Noroeste","Sao paulo");
    voo4.setCompanhia(comp2);
    Voo voo5 = Voo.with_parameters( "11/05/2022", "3:45", 62344, "Fortaleza", "Sul","Sao paulo");
    voo5.setCompanhia(comp1);
    Voo voo6 = Voo.with_parameters( "25/08/2021", "17:50",84658, "Goiania", "Noroeste","Sao paulo");
    voo6.setCompanhia(comp2);

    Voo voo7 = Voo.with_parameters( "26/05/2023", "5:30", 83673, "Brasília", "Noroeste","Fortaleza");
    voo7.setCompanhia(comp2);
    Voo voo8 = Voo.with_parameters( "11/05/2022", "3:45", 92948, "Palmas", "Sul","Fortaleza");
    voo8.setCompanhia(comp1);
    Voo voo9 = Voo.with_parameters( "25/08/2021", "17:50", 34053, "Manaus", "Noroeste","Fortaleza");
    voo9.setCompanhia(comp2);
    Aeroporto palmas1= Aeroporto.with_parameters("Brigadeiro Lysias Rodrigues","5453345", "Palmas","Tocantins","Brasil");
    palmas1.insereVoo(voo1);
    palmas1.insereVoo(voo2);
    palmas1.insereVoo(voo3);
    Aeroporto fortaleza1= Aeroporto.with_parameters("Pinto Martins","34368834", "Fortaleza","Ceara","Brasil");
    fortaleza1.insereVoo(voo7);
    fortaleza1.insereVoo(voo8);
    fortaleza1.insereVoo(voo9);
    fortaleza1.insereVoo(voo5);

    Aeroporto saoPaulo1= Aeroporto.with_parameters('Guarulhos',"3454325", "Sao paulo","Sao paulo","Brasil");
    saoPaulo1.insereVoo(sp1);
    saoPaulo1.insereVoo(sp2);
    saoPaulo1.insereVoo(sp3);
    saoPaulo1.insereVoo(sp4);
    saoPaulo1.insereVoo(sp5);
    saoPaulo1.insereVoo(sp6);
    saoPaulo1.insereVoo(voo4);
    saoPaulo1.insereVoo(voo5);
    saoPaulo1.insereVoo(voo6);

    Aeroporto saoPaulo2=Aeroporto.with_parameters("Congonhas","34555345", "Sao paulo","Sao paulo","Brasil");
    saoPaulo2.insereVoo(sp1);
    saoPaulo2.insereVoo(sp2);
    saoPaulo2.insereVoo(sp3);
    saoPaulo2.insereVoo(sp4);
    saoPaulo2.insereVoo(sp5);
    saoPaulo2.insereVoo(sp6);
    saoPaulo2.insereVoo(voo4);
    saoPaulo2.insereVoo(voo5);
    saoPaulo2.insereVoo(voo6);

    infra.insereAeroporto(palmas1);
    infra.insereAeroporto(fortaleza1);
    infra.insereAeroporto(saoPaulo1);
    infra.insereAeroporto(saoPaulo2);
    if( infra.getAeroportosPorCidadeEstado.isEmpty == true){
    infra.getAeroportoPorCidadeEEstado("Palmas","Tocantins");
    infra.estadoInfra = 'Tocantins';
    infra.cidadeInfra = 'Palmas';
    }
  }

  void avancar(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAeroportos(aeroporto: infra.vetAeroportosCidadeEstado)));
  }
  @override
  Widget build (BuildContext context) {
     if(infra.getAeroportos.isEmpty == true){
      carregaDados();
     }
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
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Padding(padding: EdgeInsets.only(right: 250),
                            child:Text("Estado", style: AppTextStyles.dropDownTitle,)),
                        DropDownEstado(
                          callback: (String estado){
                            setState((){
                             valorEstado = estado;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Padding(padding: EdgeInsets.only(right: 250),
                            child:Text("Cidade", style: AppTextStyles.dropDownTitle,)),
                        DropDownCidade(
                          callback: (String cidade){
                            setState((){
                              valorCidade = cidade;
                            });
                          },
                        ),Padding(padding: EdgeInsets.only(top: 307)),
                        Row(children: <Widget> [
                          ElevatedButton(
                              onPressed: (){
                                if(valorEstado!= '' || valorCidade != ''){
                                infra.getAeroportoPorCidadeEEstado(valorCidade,valorEstado);
                                }
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





