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

  //   @override
  // // TODO: implement initState
  // void get initState => super.initState;

    @override

void didChangeDependencies() {
    super.didChangeDependencies();


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
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
             // Image(image: ResizeImage(AssetImage('assets/customer1.png'), width: 40, height: 50)),
              // Text("Electronics store ", style:TextStyle(fontSize: 40,color: Colors.white, fontStyle: FontStyle.italic, letterSpacing: 0,
              // ) ,
              // ),
              // SizedBox(height: 20),
              //  Text("Buy electronic items at reasonable prices", style:TextStyle(fontSize:18,color: Colors.white, wordSpacing: 12, 
              // ) ,
              // ),
               SizedBox(
                height: 80,
                child: new Container(
                padding: const EdgeInsets.only(left: 20.0, top:20,bottom: 10.0),
                // child: new ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.purple, // background
                //     onPrimary: Colors.white, // foreground
                // ),
                //   child: const Text('Learn more'),
              
              
                //   onPressed: () {
                //      Navigator.push(  
                // context,  
                // MaterialPageRoute(builder: (context) => MyLogin()),  
                //           );  
                //     // It returns true if the form is valid, otherwise returns false
                //     // if (_formKey.currentState!.validate()) {
                //     //   // If the form is valid, display a Snackbar.
                //     // }
                //   },
                // )
                ),
              ),

              
              

          ],
          )
          ),
      ),
      );
    }
  }