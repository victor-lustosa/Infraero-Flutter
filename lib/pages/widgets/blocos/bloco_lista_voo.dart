import 'package:flutter/material.dart';
import 'package:infraero/models/voo.dart';
import 'package:infraero/pages/config/app_text_styles.dart';



class BlocoListaVoo extends StatelessWidget {
  final Voo voo;
  final Function onTap;

  BlocoListaVoo({
    required this.voo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(voo.getDestino, style: AppTextStyles.fonteLista,),
        onTap:() => onTap,
      ),
    );
  }
}
