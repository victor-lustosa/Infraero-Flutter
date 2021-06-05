import 'package:flutter/material.dart';
import 'package:infraero/pages/config/app_gradient.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
class ListaAeroportos extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar:
        PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row( children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),],),
                    Row(
                      children:<Widget>[
                        Text("Aeroportos", style: AppTextStyles.titleBlue,)],
                      mainAxisAlignment: MainAxisAlignment.center,)
                    ,],))),
        body: SafeArea(
          child:  PageView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget> [
                Container(
                  decoration: BoxDecoration(gradient: AppGradients.linear),

                  // child: Column(
                  //     children: <Widget> [
                  //       Padding(padding: EdgeInsets.only(bottom: 60)),
                  //       Text("Infraero", style: AppTextStyles.title,)
                ) ]            // ),
          ),
        )
    );
  }
}
