import 'package:flutter/material.dart';  
  
void main() {  
  runApp(MaterialApp(  
    title: 'Flutter Navigation',  
    theme: ThemeData(  
      // This is the theme of your application.  
      primarySwatch: Colors.green,  
    ),  
    home: FirstRoute(),  
  ));  
}  
  
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
                  icon: const Icon(Icons.person),
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











 
  
class SecondRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container (
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
      child: Scaffold(  


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
            height: 75, // <-- SEE HERE
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
                child: const Text('Customer'),


                onPressed: () {
                   Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => thirdRoute()),  
            );  
                  // It returns true if the form is valid, otherwise returns false
                  // if (_formKey.currentState!.validate()) {
                  //   // If the form is valid, display a Snackbar.
                  // }
                },
              )),
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
              new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
                child: const Text('Products'),


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
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
              new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
                child: const Text('Supplier'),


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
              SizedBox(
            height: 15, // <-- SEE HERE
          ),
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
                child: const Text('Purchase'),


                onPressed: () {
                   Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => FirstRoute()),  
            );  
                  // It returns true if the form is valid, otherwise returns false
                  // if (_formKey.currentState!.validate()) {
                  //   // If the form is valid, display a Snackbar.
                  // }
                },
              )),
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
        title: Text('First Screen'),  
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
            child: Text("Supplier", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
          ),
          SizedBox(
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
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
            height: 5, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
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
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
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
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
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
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
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
            height: 10, // <-- SEE HERE
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
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
            height: 5, // <-- SEE HERE
          ),
       
        
          // ignore: unnecessary_new
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: new ElevatedButton(
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











 











 












