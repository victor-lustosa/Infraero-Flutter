import 'package:flutter/material.dart';
import 'package:infraero/models/cidade.dart';
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
        hint: Text("  selecione uma cidade.",style: AppTextStyles.dropDown,),
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
                              infra.getAeroportoPorCidadeEEstado(_cidadeSelecionada.nome,_estadoSelecionado.nome);

                              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAeroportos(cidade: _cidadeSelecionada.nome,estado: _estadoSelecionado.nome,)));
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



