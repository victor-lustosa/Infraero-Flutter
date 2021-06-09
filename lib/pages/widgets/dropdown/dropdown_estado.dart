import 'package:flutter/material.dart';
import 'package:infraero/pages/config/app_colors.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
class DropDownEstado extends StatefulWidget {
  DropDownEstado({required this.callback});
  final Function(String) callback;
  @override
  _DropDownEstadoState createState() => _DropDownEstadoState();
}

class _DropDownEstadoState extends State<DropDownEstado> {
  String nomeEstado="";
  String dropDownStringItem = '';
  List<String> Estados = ['Tocantins','Sao paulo','brasilia','Rio de Janeiro'];
  String _itemSelecionado ='Tocantins';

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
            items : Estados.map((String dropDownStringItem) {

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