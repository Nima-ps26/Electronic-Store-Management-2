import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class Invoicepageprint extends StatelessWidget {
  String customername, itemname, name, email, business, business5;
  int quantity, amount;
  Invoicepageprint({
    required this.customername,
    required this.name,
    required this.itemname,
    required this.quantity,
    required this.amount,
    required this.email,
    required this.business,
    required this.business5,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Color(0xffFFB900),
                    // Color(0xffFF9800),
                    Colors.orangeAccent,
                    Colors.orangeAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Electronic Store',
                      style: TextStyle(
                        color: Color.fromARGB(255, 22, 21, 21),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hampankatta,mangalore',
                      style: TextStyle(
                        color: Color.fromARGB(255, 245, 242, 242),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'INVOICE',
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 239, 15),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 2.0, thickness: 5.0),
            Container(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                SizedBox(height: 20),
                Text(
                  'Customer Name: $customername',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Authorised person: $name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'Email: $email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Supplier Name: $business',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Email: $business5',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ]),
            )),
          
            SizedBox(height: 30),
            Text(
              'Thank you for your purchase! Please visit us again!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
