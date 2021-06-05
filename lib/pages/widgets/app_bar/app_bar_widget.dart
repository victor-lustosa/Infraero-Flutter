import 'package:flutter/material.dart';
import 'package:infraero/pages/config/app_text_styles.dart';
class AppBarWidget extends PreferredSize {

  AppBarWidget()
      : super(
      preferredSize: Size.fromHeight(250),
      child: Container(
        height: 250,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 161,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                  )
                  )
                ],
              ),
            ),
          ],
        ),
     )
  );
}
