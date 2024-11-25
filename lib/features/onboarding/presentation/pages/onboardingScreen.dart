import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_project/core/widgets/background_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: backgroundWidget(
        Widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: size.height * 0.14)),
                      Text(
                        "BIENVENUE ", 
                        style: GoogleFonts.quando(
                          textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,

                        ),
                        )
                      ),
                      Text(
                        "SUR ", 
                        style: GoogleFonts.quando(
                          textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        )
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'LOGO',
                            style: TextStyle(
                              fontSize: 24,
                              color: primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.pangolin(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                          children: [
                            TextSpan(text: 'Nous somme une famille unie'),
                              TextSpan(text: '\n en'),
                              TextSpan(text: '\nJESUS CHRIST'),
                          ]
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push( "/login");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary, // Couleur bleu foncé
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ),
                    SizedBox(height: 20), 
                    ],
                  ),
    ),
    );
  }
}


int hexToInteger(String hex) => int.parse(hex, radix: 16);

