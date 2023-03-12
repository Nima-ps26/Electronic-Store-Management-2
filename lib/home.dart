import 'package:esm/splash.dart';
import 'package:flutter/material.dart';

import 'main.dart';  
class FirstRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      child: Scaffold(  


      // appBar: AppBar(  
      //   //title: Text('First Screen'),  
      //   backgroundColor: Colors.purple,
      // ),       
      body: Center(  
        child: Container(
          decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
          child: Column(
            
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                    // Container(
                    //     child: Text("Login Page", style: TextStyle(fontSize: 20))),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 100, // <-- SEE HERE
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Electronic Store", style: TextStyle(fontSize: 30,),),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/customer1.png', height: 10, width: 20,fit: BoxFit.fill),
            ),
                
             
            SizedBox(
              height: 100, // <-- SEE HERE
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 25, // <-- SEE HERE
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.password),
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 55, // <-- SEE HERE
            ),
               
          
            // ignore: unnecessary_new
            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
                  child: const Text('Login'),
        
        
                  onPressed: () {
                     Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => SecondRoute()),  
              );  
                    // It returns true if the form is valid, otherwise returns false
                    // if (_formKey.currentState!.validate()) {
                    //   // If the form is valid, display a Snackbar.
                    // }
                  },
                )),
                    
          ],
              ),
        ),
       
      ),  
    )
    );  
  }  
}