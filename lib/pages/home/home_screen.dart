import 'package:flutter/material.dart';
import 'package:infraero/pages/aeroporto/home_aeroporto.dart';
import '../config/app_gradient.dart';
import '../config/app_images.dart';
import '../config/app_text_styles.dart';

class HomeScreen extends StatelessWidget {

  void avancar(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeAeroporto()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Column(
            children: <Widget> [
              Padding(padding: EdgeInsets.only(bottom: 60)),
              Text("Infraero", style: AppTextStyles.title,),
              Padding(padding: EdgeInsets.only(bottom: 40)),
              Center ( child: Image.asset(AppImages.logo_infraero, width:250,height:250)),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Text("Bem vindo!", style: AppTextStyles.fonte,),
              Padding(padding: EdgeInsets.only(bottom: 87)),
              Row(children: <Widget> [
                ElevatedButton(
                    onPressed: (){
                      avancar(context);
                    },
                    child: Text("Avançar", style: AppTextStyles.button),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 60)),
                    )),],
                mainAxisAlignment: MainAxisAlignment.center, ),
            ]
        ),
      ),
    );
  }
}