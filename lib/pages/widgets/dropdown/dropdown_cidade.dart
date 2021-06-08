import 'package:flutter/material.dart';
import 'package:infraero/pages/config/app_colors.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
class DropDownCidade extends StatefulWidget {
  DropDownCidade({required this.callback});
  final Function(String) callback;
  @override
  _DropDownCidadeState createState() => _DropDownCidadeState();
}
class _DropDownCidadeState extends State<DropDownCidade> {

  String _item_selecionado= "";
  setItemSelecionado(String item_selecionado) => _item_selecionado = item_selecionado;
  String nomeCidade="";
  List<String> Cidades = ['Santos','Porto Alegre','Palmas','Rio de Janeiro'];
  var _itemSelecionado = 'Santos';

  @override
  Widget build(BuildContext context) {
    return Card(
            child:DropdownButton<String>(
                style: TextStyle(color: AppColors.blue),
                icon: RotatedBox(
                    quarterTurns: 1,
                    child:Padding(padding: EdgeInsets.only(top: 10),
                    child:Icon(Icons.chevron_right, color: Colors.blue))
                ),
                items : Cidades.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child:Container(
                          width:260,
                          child: Padding(padding: EdgeInsets.only(left: 15),
                  child:Text(dropDownStringItem,style: AppTextStyles.dropDown,))

                      ));}).toList(),
                onChanged: ( String? novoItemSelecionado) {
                  _dropDownItemSelected(novoItemSelecionado!);
                  setState(() {
                    this._itemSelecionado =  novoItemSelecionado;
                  });
                },
                value: _itemSelecionado
            )

    );
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._itemSelecionado = novoItem;
      widget.callback( this._itemSelecionado);
    });
  }
}