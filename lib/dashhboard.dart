import 'package:esm/MyForm.dart';
import 'package:esm/home_screen.dart';
import 'package:esm/home_screen_cust.dart';
import 'package:esm/inv/invoice_display.dart';
import 'package:esm/inv/invoice_form.dart';
import 'package:esm/invoice.dart';
import 'package:esm/item/item_form.dart';
import 'package:esm/main.dart';
import 'package:esm/supplier/sup_form.dart';
import 'package:flutter/material.dart';
import 'report.dart';
import 'package:esm/insert_data';
import 'Purchase/purchase_display.dart';
import 'Purchase/purchase_form.dart';
import 'Purchase/purchase_display.dart';
class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  // final greenOpacity = Container(
  //   color: Color.fromARGB(197, 233, 140, 249),
  // );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lime,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: Image.network(
                      
                            'https://mars-metcdn-com.global.ssl.fastly.net/content/uploads/sites/101/2019/04/30162428/Top-Header-Background.png')
                        .image)),
          ),
          SafeArea(
              //background,
              //greenOpacity,

              child: Column(
            children: <Widget>[
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
               
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0.1,
                        ),
                       
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Dashboard",style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 40),),
              SizedBox(height: 10),
              Expanded(
                
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      children: <Widget>[
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                                Image(
                        image: AssetImage('assets/Customer.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),

                            Text(
                              'Customer',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyForm()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            
                             Image(
                        image: AssetImage('assets/product.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),
                            Text('Products',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ])),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => itemForm()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            //Image.asset('assets/debit.png', scale: 3.2),
                             Image(
                        image: AssetImage('assets/supplier.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),

                            SizedBox(
                              height: 10,
                            ),
                            Text('Supplier',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => supForm()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            //Image.asset('assets/debit.png', scale: 3.2),
                            Image(
                        image: AssetImage('assets/purchase.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Purchase',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PurchaseForm()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            //Image.asset('assets/debit.png', scale: 3.2),
                            Image(
                        image: AssetImage('assets/stock.png'),
                        width: 90, // set the desired width
                        height: 90, // set the desired height
                      ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Stocks',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Displaydatabase()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            // Image.asset(
                            //   'assets/track.jpg',
                            //   scale: 5.4,
                            // ),
                            Image(
                        image: AssetImage('assets/purchase.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),
                            SizedBox(
                              height: 22,
                            ),
                            Text('Sales',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>InvoiceForm()));
                      },
                    ),
                    InkWell(
                      child: Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            // Image.asset(
                            //   'assets/track.jpg',
                            //   scale: 5.4,
                            // ),
                            Image(
                        image: AssetImage('assets/report.png'),
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                      ),
                            SizedBox(
                              height: 22,
                            ),
                            Text('Report',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>Displaydatabases()));
                      },
                    ),
                  ])),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     width: 200,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       color: Colors.purple,
              //     ),
              //     child: Center(child: Text('Home',style: TextStyle(fontSize: 30),)),
              //   ),
              // ),
            ],
          ))
        ],
      ),
    );
  }
}