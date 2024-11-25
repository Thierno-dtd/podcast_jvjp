import 'package:flutter/material.dart';

Widget backgroundWidget({required Widget Widget}) {
  return Container(
        constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 primary, // Première couleur du dégradé
                secondary, // Deuxième couleur du dégradé
              
              ]
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
                child: Widget           
              ),
            ) ,
          
        
        
        
    );
}

final Color primary = Color(0xFF043A5B);
final Color secondary = Color(0xFF9BCEF3);