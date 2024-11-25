
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_project/core/widgets/background_widget.dart';

AppBar appBar(String title) {
  return AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            title,
            style: GoogleFonts.quando(
              textStyle: TextStyle(
                color: Colors.white,
              )
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              colors: [primary, secondary],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), 
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              
            },
            child: Icon(
              Icons.search, size: 40, color: Colors.white,
            ),
          )
        ],
      );
}