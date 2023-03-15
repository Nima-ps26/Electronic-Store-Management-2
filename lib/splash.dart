import 'package:esm/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import 'login.dart';
class splashscreen extends StatefulWidget{
  @override
  _splashscreenState createState() => _splashscreenState();
}
  class _splashscreenState extends State<splashscreen> {

    @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 5),(){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context)=>MyLogin()));
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 151, 36, 197),
        body: Center(
          child: Container(
          decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/ircl.png'), fit: BoxFit.cover)
      ),
          
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          // //   children: [
          // //     SizedBox(height: 50),
          // //    // Image(image: ResizeImage(AssetImage('assets/customer1.png'), width: 40, height: 50)),
          // //     Text("Electronics store ", style:TextStyle(fontSize: 40,color: Colors.white, fontStyle: FontStyle.italic, letterSpacing: 0,
          // //     ) ,
          // //     ),
          // //     SizedBox(height: 20),
          // //      Text("Buy electronic items at reasonable prices", style:TextStyle(fontSize:18,color: Colors.white, wordSpacing: 12, 
          // //     ) ,
          // //     ),
              
              

          // // ],
          // )
          ),
      ),
      );
    }
  }