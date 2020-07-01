import 'package:flutter/material.dart';

class AppThemeLight {
  
  ThemeData getTheme() {
    // Implementar temas especializados.
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff0D47A1),

        // Cards
        cardTheme: CardTheme(color: Colors.white),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),

        iconTheme: IconThemeData(
          color: Color(0xff0D47A1)
        ),
        
        

        //App Bar
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline4: TextStyle(fontSize: 30)),
        ));
  }
}
