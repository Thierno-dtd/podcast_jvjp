import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:podcast_project/core/widgets/background_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              icon: Icon(Icons.settings, size: 35,), // Replace with your desired icon
              onPressed: () {
                // Handle icon tap event (optional)
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.3),
        child: SafeArea(
          child: Padding(
            
            padding: EdgeInsets.all(14.0),
            child: Container(
              constraints: BoxConstraints.expand(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    Container(
                      width: size.width,
                      height: size.height*0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            primary, 
                            secondary, 
                          ]
                        ),
                        boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 4,),
                              Text(
                                "Sermet du dimanche 17 Nov 2024",
                                style: GoogleFonts.quando(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  )
                                ),
                              ),
                              SizedBox(height: 2,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width - 8,
                                      height: size.height/7,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                      ),
                                      child: Image.asset(
                                          'assets/images/background.jpeg', // Chemin vers votre image
                                          fit: BoxFit.cover,
                                        ),
                                    ),
                                    Container(
                                      width: size.width - 8,
                                      height: size.height/14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                        color: primary,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text.rich(
                                              TextSpan(
                                                text: "iusto odio dignissimos ducimus",
                                                style: GoogleFonts.quando(
                                                  textStyle: TextStyle(
                                                    fontSize: 10, color: Colors.white,
                                                  ),
                                                  
                                                ),
                                              
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                            ),
                                              )
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: Colors.white, width: 1.0, style: BorderStyle.solid),
                                                color: primary,
                                              ),
                                              child: Icon(
                                                Icons.open_in_new, color: Colors.white, size: 15,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                             Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: Colors.white, width: 1.0, style: BorderStyle.solid),
                                                color: primary,
                                              ),
                                              child: Icon(
                                                Icons.download, color: Colors.white, size: 20,
                                              ),
                                            ),
                                          ],
                                        
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    context.push('/sermons');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                    "Voir plus >>>",
                                    style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                                                ),
                                  ),
                                ),
                              )
                            ],
                          ),
                      ),
                      SizedBox(height:14,),

                    GestureDetector(
                      onTap: () {
                        context.push("/podcast");
                      },
                      child: Container(
                      width: size.width,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: primary,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            //spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                        "Nos Podcasts", 
                        style: GoogleFonts.quando(
                          textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                  height: size.height *0.25,
                  width: size.width * 6/ 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Verset du jour !",
                          style: GoogleFonts.quando(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "     Jean 3:16  ",
                          style: GoogleFonts.quando(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Text.rich(
                                  TextSpan(
                                    text:
                                        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
                                    style: GoogleFonts.quando(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                   
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  textAlign: TextAlign.justify,
                                );
                              },
                            ),
                            )
                          ),
                          const SizedBox(height: 2),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                                    onTap: () {
                                      // Action pour afficher tout le texte
                                    },
                                    child: const Text(
                                      "Voir plus >>>",
                                      style: TextStyle(
                                        color: Color(0xFF043A5B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width:12),
                         GestureDetector(
                                    onTap: () {
                                      context.push("/reel");
                                    },
                                    child:
                                       Container(
                          height: size.height * 0.25,
                          width: size.width * 4 / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              children: [
                                // Image de fond
                                Positioned.fill(
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.6), // Assombrissement de l'image
                                      BlendMode.darken,
                                    ),
                                    child: Image.asset(
                                      'assets/images/background.jpeg', // Chemin vers votre image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Texte par-dessus l'image
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child:
                                   Text(
                                    "Nos publications",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ),
                                
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 50,),
                                  
                                ), 
                                SizedBox(height: 15)
                                
                              ],
                            ),
                          ),
                        ),
                        

                                  ),
                     
                      ],
                    ),
                      
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push('/events');
                            },
                            child: Container(
                            height: size.height * 0.20,
                            width: size.width * 6 / 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Stack(
                                children: [
                                  // Image de fond
                                  Positioned.fill(
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5), // Assombrissement de l'image
                                        BlendMode.darken,
                                      ),
                                      child: Image.asset(
                                        'assets/evenement.gif', // Chemin vers votre image
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                   Center( // Center the text
                                    child: Text(
                                      'Nos Événements',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                                                    ),
                          ),
                        SizedBox(width: 12,),
                        Container(
                          height: size.height * 0.20,
                          width: size.width * 4 / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                primary, 
                                secondary, 
                              ]
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(padding: EdgeInsets.all(8),
                            child: Center(
                              
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.20* 0.10,),
                                  Icon(
                                    Icons.people_outline, color: Colors.white, size: 40,
                                  ),
                                  SizedBox(height: size.height * 0.20* 0.10,),
                                  Text(
                                    "Nous contactes", 
                                    style: GoogleFonts.quando(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white
                                      )
                                    ),)
                                ],
                              ),
                            ),
                          ),
                        )
                        ],
                      )
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}