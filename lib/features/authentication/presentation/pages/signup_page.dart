import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:podcast_project/core/widgets/background_widget.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ) ,
      body: backgroundWidget(
        Widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: [
              Padding(
                padding: EdgeInsets.only(top : size.height/35),
                ),
                Text(
                  " Logo de l'application",
                  style:  TextStyle(
                      color: Colors.white,              
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.quando(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    children: [
                      TextSpan(text: 'Sign up here! '),
                      
                    ]
                  ),
                ),
              SizedBox(height: 60),
              Container(
                  width: size.width,
                  height: size.height/4,
                  
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:Row(
                        children: [
                          
                          Container( 
                              width: size.width<300 ? size.width-20: 320,
                              
                                      child: Column(
                                        children: [
                                          TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "FirstName",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  
                                  decoration: InputDecoration(
                                    labelText: "LastName",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    
                                  ),
                                    
                                ),
                              ],
                            ),
                          ),
                        SizedBox(width: 15),
                        Container( 
                              width: size.width<300 ? size.width-20: 320,
                                      child: Column(
                                        children: [
                                          TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Adress",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    
                                  ),
                                    
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container( 
                              width: size.width<300 ? size.width-20: 320,
                                      child: Column(
                                        children: [
                                          TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    
                                  ),
                                  
                                  decoration: InputDecoration(
                                    labelText: "confirm your Password",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    
                                  ),
                                    
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ),
                      SizedBox(height: 20),
                      Text("Coulissez pour remplir les autres champs", style: GoogleFonts.quando(textStyle: TextStyle(color: Colors.white , fontSize: 10, ),),) 
                    ],
                  ),
                ),
              
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text("Login", style: GoogleFonts.quando(textStyle: TextStyle(color: Colors.white ),),),
                onPressed: () {
                  context.go("/home");
                },
              ),
              SizedBox(height: 20),
              Text(
                  "~or login with~",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 15.0, ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GestureDetector(
                    onTap: () {
                      // Code à exécuter lorsque l'utilisateur clique sur le premier conteneur
                      print('Google clicked!');
                      // Ici, vous pouvez déclencher l'authentification Google
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(padding: EdgeInsets.all(2.0),child: Image.asset('assets/images/google.png', fit: BoxFit.contain),),
                    ),
                  ),
                  SizedBox(width: 60),
                  GestureDetector(
                    onTap: () {
                      print('Facebook clicked!');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/facebook.png', fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
              //Spacer(),
              SizedBox(height: 40),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.quando(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    children: [
                      TextSpan(text: ' have I an account ?'),
                      TextSpan(text: ' Login', recognizer: TapGestureRecognizer()..onTap = () => context.push("/login"), style: TextStyle(decoration: TextDecoration.underline, color: primary, fontWeight: FontWeight.bold),),
                    ]
                  ),
                ),
                SizedBox(height: 5),
            ],
            ),
          ),
   
        ),
      );
  }
}

Container twoTextField(){
  return Container(
            width: 200,
                    child: Column(
                      children: [
                        TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  
                ),
                
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  
                ),
                  
              ),
                      ],
                    ),
                  );
}