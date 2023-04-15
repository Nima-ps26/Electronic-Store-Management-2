import 'package:esm/home_screen.dart';
import 'package:esm/home_screen_cust.dart';
import 'package:esm/pages/home_page.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'inv/invoice_form.dart';
import 'report.dart';
import 'package:esm/splash.dart';
// ignore: unused_import
import 'purchase.dart';
import 'package:flutter/material.dart';  
import 'sample.dart';
import 'package:esm/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'pages/intro_screen.dart';
import 'invoice.dart';
import 'stock.dart';
import 'print.dart';
import 'dashhboard.dart';
import 'inv/invoice_display.dart';
import 'try.dart';
void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(MaterialApp(  
    title: 'Flutter Navigation',  
    theme: ThemeData(  
      // This is the theme of your application.  
      primarySwatch: Colors.green,  
    ),  
    home:splashscreen(),  
  ));  
}  
class MyApp extends  StatelessWidget {
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DP",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: splashscreen(),
    );
}
}


class SecondRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
      child: Scaffold(  
        resizeToAvoidBottomInset: false,


      // appBar: AppBar(  
      //   title: Text('Options:'),  
      // ),  
      body: Center(  
        child: Container(
        decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
             // child: Text("Sign Up Page", style: TextStyle(fontSize: 20))
              ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 175, // <-- SEE HERE
          ),
          SizedBox(
            height: 80,
            child: new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
                  child: const Text('Customer'),
          
          
                  onPressed: () {
                     Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => seventhRoute()),  
              );  
                    // It returns true if the form is valid, otherwise returns false
                    // if (_formKey.currentState!.validate()) {
                    //   // If the form is valid, display a Snackbar.
                    // }
                  },
                )),
          ),
              SizedBox(
            height: 15, // <-- SEE HERE
          ),

              SizedBox(
                height:80, //height of button
               
                
                child: new Container(
                 padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
                    
                ),
                  child: const Text('Products'),
              
              
                  onPressed: () {
                    

                     Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => seventhRoute()),  
                          );  
                //     // It returns true if the form is valid, otherwise returns false
                //     // if (_formKey.currentState!.validate()) {
                //     //   // If the form is valid, display a Snackbar.
                //     // }
                  },
                )),
              ),
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
              SizedBox(
                height: 80,
                child: new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
                ),
                  child: const Text('Supplier '),
              
              
                  onPressed: () {
                     Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => fourthRoute()),  
                          );  
                    // It returns true if the form is valid, otherwise returns false
                    // if (_formKey.currentState!.validate()) {
                    //   // If the form is valid, display a Snackbar.
                    // }
                  },
                )),
              ),
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
          // ignore: unnecessary_new
        
           SizedBox(
              height: 80,
              child: new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                  child: new ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // background
                      onPrimary: Colors.white, // foreground
              ),
                    child: const Text('Sales'),
                      
                      
                    onPressed: () {
                       Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => InvoicePage()),  
                );  
                      // It returns true if the form is valid, otherwise returns false
                      // if (_formKey.currentState!.validate()) {
                      //   // If the form is valid, display a Snackbar.
                      // }
                    },
                  )),
            ),
          
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
                  
        ],
      ),
       
      ),  
    ),));  
  }  
}

class thirdRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      child: Scaffold(  


      appBar: AppBar(  
        title: Text('First Screen'),  
      ),  
      body: Center(  
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
            child: Text("Electronic Store", style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),),
          ),
          SizedBox(
            height: 100, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first name',
                labelText: 'First Name',
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
            height: 5, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Username',
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
            height: 5, // <-- SEE HERE
          ),
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
                child: const Text('Sign Up'),


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
    )
    );  
  }  
}
//supplier
class fourthRoute extends StatelessWidget {  
 
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      
      child: Scaffold(  


      appBar: AppBar(  
        title: Text('Supplier'),  
        backgroundColor: Colors.purple,
      ),  
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
            height: 40, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Add the new Supplier", style: TextStyle(fontSize: 20,),),
          ),
          SizedBox(
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Business name',
                labelText: 'Business Name',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'GST number',
                labelText: 'GST number',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Authorised persons name:',
                labelText: 'Authorised persons name:',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.call),
                hintText: 'Business contact number',
                labelText: 'Business contact number',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly),
                hintText: 'Personal contact number',
                labelText: 'Personal contact number',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Email',
                labelText: 'Email',
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
            height: 1, // <-- SEE HERE
          ),
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              
              child: new ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
                child: const Text('Add Supplier'),


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
    )
    ));  
  }  
}


//supplier
class fifthRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      
      child: Scaffold(  


      appBar: AppBar(  
        title: Text('Sales'),  
        backgroundColor: Colors.purple,
      ),  
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
            height: 40, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Sales", style: TextStyle(fontSize: 20,),),
          ),
          SizedBox(
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'Supplier id',
                labelText: 'Supplier id',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.add_box),
                hintText: 'Item code',
                labelText: 'Item code',
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
            height: 1, // <-- SEE HERE
          ),
         
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.production_quantity_limits),
                hintText: 'Quantity',
                labelText: 'Quantity',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.money),
                hintText: 'Amount',
                labelText: 'Amount',
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
            height: 1, // <-- SEE HERE
          ),
         
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              
              child: new ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
                child: const Text('Generate bill'),


                onPressed: () {
                   Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => InvoicePage()),  
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
    )
    ));  
  }  
}

// Adding the item attributes

//supplier
class sixthRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      
      child: Scaffold(  


      appBar: AppBar(  
        title: Text('Add items'),  
        backgroundColor: Colors.purple,
      ),  
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
            height: 40, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Add the Item details", style: TextStyle(fontSize: 20,),),
          ),
          SizedBox(
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.gif_box_sharp),
                hintText: 'Item name',
                labelText: 'Item Name',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.details),
                hintText: 'Item specification',
                labelText: 'Item specification',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.numbers_sharp),
                hintText: 'HSN code',
                labelText: 'HSN code',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.money),
                hintText: 'Amount',
                labelText: 'Amount',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.support_agent),
                hintText: 'Supplier id',
                labelText: 'Supplier id',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.image),
                hintText: 'Item Images',
                labelText: 'Item Images',
                border: OutlineInputBorder(),
              ),
              
            ),
          ),
          SizedBox(
            height: 1, // <-- SEE HERE
          ),
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              
              child: new ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
                child: const Text('Add Items'),


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
    )
    ));  
  }  
}

class seventhRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
    
      
      child: Scaffold(  
resizeToAvoidBottomInset: false,

      appBar: AppBar(  
        title: Text('Add B2B customer details'),  
        backgroundColor: Colors.purple,
      ),  
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
            height: 40, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Add the customer details here(B2B)", style: TextStyle(fontSize: 20,),),
          ),
          SizedBox(
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Business Name:',
                labelText: 'Business Name:',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'GST number',
                labelText: 'GST number',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_2_rounded),
                hintText: 'Authorised persons name',
                labelText: 'Authorised persons name',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Business contact number',
                labelText: 'Business contact number::',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly),
                hintText: 'Personal contact number:',
                labelText: 'Personal contact number:',
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
            height: 1, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              
            ),
          ),
          SizedBox(
            height: 1, // <-- SEE HERE
          ),
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              
              child: new ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
                child: const Text('Add Customers'),


                onPressed: () {
                   Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => fifthRoute()),  
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
    )
    ));  
  }  
}