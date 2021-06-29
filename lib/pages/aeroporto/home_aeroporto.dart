import 'package:flutter/material.dart';
import 'package:infraero/models/cidade.dart';
import 'package:infraero/models/companhia.dart';
import 'package:infraero/models/estado.dart';
import 'package:infraero/models/gestor_companhias.dart';
import 'package:infraero/models/infraero.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/aeroporto/lista_aeroportos.dart';
import 'package:infraero/pages/config/app_colors.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
import 'package:infraero/models/aeroporto.dart';


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
  bool enabled = false;
  bool disabled = false;
  bool cidadeSelected = false;
  bool estadoSelected = false;
  Estado estado = Estado();
  String dropDownStringCidade = '';

  final List<Estado> Estados = [
    Estado.with_parameters('São Paulo'),
    Estado.with_parameters('Ceara'),
    Estado.with_parameters('Rio de Janeiro'),
    Estado.with_parameters('Tocantins'),
  ];
  List<Cidade> Cidades = [];
  late Cidade _cidadeSelecionada = Cidade();
  String dropDownStringEstado = '';
   late Estado _estadoSelecionado;

  void carregaDados(){
    Companhia? comp1 = Companhia.with_parameters('Fly Emirates', 09786);
    Companhia? comp2 = Companhia.with_parameters("GOL", 08769);
    gestComp.insereCompanhia(comp1);
    gestComp.insereCompanhia(comp2);

    Cidade cidade1 = Cidade();
    cidade1.setNome('Palmas');
    cidade1.setEstado('Tocantins');
    Cidade cidade2 = Cidade();
    cidade2.setNome('Fortaleza');
    cidade2.setEstado('Ceara');
    Cidade cidade3 = Cidade();
    cidade3.setNome('Rio de Janeiro');
    cidade3.setEstado('Rio de Janeiro');
    Cidade cidade4 = Cidade();
    cidade4.setNome('São Paulo');
    cidade4.setEstado('São Paulo');

    estado.insereCidade(cidade1);
    estado.insereCidade(cidade2);
    estado.insereCidade(cidade3);
    estado.insereCidade(cidade4);

    print(Estados.toString());
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

  }

  void avancar(BuildContext context){

  }
  @override
  Widget build (BuildContext context) {

    var dropdownEstado = Card(
        child:Container(
            width:250,
            height: 48,
        child:Column(
            children:[
        DropdownButton<Estado>(
        style: TextStyle(color: AppColors.blue),
        icon: RotatedBox(
            quarterTurns: 1,
            child:Padding(padding: EdgeInsets.only(top: 10),
                child:Icon(Icons.chevron_right, color: Colors.blue))
        ),
        items : Estados.map((Estado dropDownStringItem) {
          return DropdownMenuItem<Estado>(
              value: dropDownStringItem,
                  child: Padding(padding: EdgeInsets.only(left: 15),
                      child:Text(dropDownStringItem.nome,style: AppTextStyles.dropDown,))
              );}).toList(),
        onChanged: ( Estado? novoItemSelecionado) {
          _dropDownEstadoSelected(novoItemSelecionado!);
          setState(() {
            this._estadoSelecionado =  novoItemSelecionado;
          });
        },
        hint: Text("selecione um estado.",style: AppTextStyles.dropDown,),
        value:estadoSelected ? _estadoSelecionado : null
    )])));

    var dropdownCidade = Card(
      child:Container(
          width:250,
          height: 48,
        child:Column(
      children:[
        DropdownButton<Cidade>(
            style: TextStyle(color: AppColors.blue),
            icon: RotatedBox(
                quarterTurns: 1,
                child:Padding(padding: EdgeInsets.only(top: 10),
                    child:Icon(Icons.chevron_right, color: Colors.blue))
            ),
            items : Cidades.map((Cidade dropDownStringItem) {
              return DropdownMenuItem<Cidade>(
                  value: dropDownStringItem,
                      child: Padding(padding: EdgeInsets.only(left: 15),
                          child:Text(dropDownStringItem.nome,style: AppTextStyles.dropDown,))

                  );}).toList(),
            onChanged: this.enabled ? ( Cidade? novoItemSelecionado) {
              _dropDownCidadeSelected(novoItemSelecionado!);
              setState(() {
                this._cidadeSelecionada =  novoItemSelecionado;
              });
            } : null,
        hint: Text("  selecione um estado.",style: AppTextStyles.dropDown,),
            value:cidadeSelected ? this._cidadeSelecionada : null,
    )])));

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
                        dropdownEstado,
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Padding(padding: EdgeInsets.only(right: 250),
                            child:Text("Cidade", style: AppTextStyles.dropDownTitle,)),
                        dropdownCidade,
                        Padding(padding: EdgeInsets.only(top: 307)),
                        Row(children: <Widget> [
                          ElevatedButton(
                              onPressed: (){
                                if(_cidadeSelecionada.nome != null && _estadoSelecionado.nome!= null){
                                infra.getAeroportoPorCidadeEEstado(_cidadeSelecionada.nome,_estadoSelecionado.nome);

                                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAeroportos(cidade: _cidadeSelecionada.nome,estado: _estadoSelecionado.nome,)));
                              }},
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
  void _dropDownCidadeSelected(Cidade novoItem){
    setState(() {
      this._cidadeSelecionada = novoItem;
      this.cidadeSelected= true;
    });
  }
  void _dropDownEstadoSelected(Estado novoItem){
    setState(() {
      this._estadoSelecionado = novoItem;
      this.estadoSelected = true;
      this.enabled = true;
      this.Cidades = this.estado.getCidadePorEstado(novoItem.nome);
    });
  }
}



