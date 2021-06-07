import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/config/app_text_styles.dart';



class BlocoLista extends StatelessWidget {
  final Aeroporto aeroporto;
  final Function onTap;

  BlocoLista({
    required this.aeroporto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(aeroporto.getNome, style: AppTextStyles.fonteLista,),
        onTap:() => onTap,
      ),
    );
  }
}
