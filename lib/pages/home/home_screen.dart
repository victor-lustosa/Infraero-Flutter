import 'package:flutter/material.dart';
import '../config/app_gradient.dart';
import '../config/app_images.dart';
import '../config/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Column(
            children: <Widget> [
              Padding(padding: EdgeInsets.only(bottom: 60)),
              Text("Infraero", style: AppTextStyles.title,),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Center ( child: Image.asset(AppImages.logo_infraero, width:300,height:300)),
              Padding(padding: EdgeInsets.only(bottom: 18)),
              Text("Bem vindo!", style: AppTextStyles.fonte,),
              Padding(padding: EdgeInsets.only(bottom: 65)),
              Row(children: <Widget> [
                ElevatedButton(
                    child: Text("Avançar", style: AppTextStyles.button, ),
                    onPressed: (null),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 60)),
                )),],
                mainAxisAlignment: MainAxisAlignment.center, ),
            ]
        ),
      ),
    ) ;
  }
}