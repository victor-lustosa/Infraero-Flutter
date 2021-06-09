import 'package:flutter/material.dart';
import 'package:infraero/models/aeroporto.dart';
import 'package:infraero/pages/config/app_text_styles.dart';



class BlocoListaAeroporto extends StatelessWidget {
  final Aeroporto aeroporto;
  final VoidCallback? onTap;

  BlocoListaAeroporto({
    required this.aeroporto,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(aeroporto.getNome, style: AppTextStyles.fonteLista,),
        onTap: onTap,
      ),
    );
  }
}
