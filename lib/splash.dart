import 'package:esm/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
class splashscreen extends StatefulWidget{
  @override
  _splashscreenState createState() => _splashscreenState();
}
  class _splashscreenState extends State<splashscreen> {

    @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context)=>FirstRoute()));
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dear programmer", style:TextStyle(fontSize: 45,color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1,
              ) ,
              ),
              SizedBox(height: 30),
               Text("Dear programmer developer", style:TextStyle(fontSize:18,color: Colors.white, fontStyle: FontStyle.italic, letterSpacing: 1,
              ) ,
              ),

          ],
          )),
      );
    }
  }