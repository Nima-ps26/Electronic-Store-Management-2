import 'package:flutter/material.dart';

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
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
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
            SizedBox(height: 20),

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

            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Item Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Quantity',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(itemname),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(amount.toString()),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(quantity.toString()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(height: 10),
                   Container(
                child: Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                SizedBox(height: 20),
                Text(
                  'Total: ${(amount*quantity).toStringAsFixed(2)}',
                  style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                
               
               
              ]),
            )
            ),
             SizedBox(height: 20),
                   Container(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                SizedBox(height: 20),
               

                  Text(
                  'Total(with GST): ${(((amount*1.1)*quantity)).toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 11, 11),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
               
                SizedBox(height: 20),
               
               
              ]),
            )),
             SizedBox(height: 40),
            Text(
              'Thank you for your purchase. Please visit us again!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
             SizedBox(height: 30),
            Text(
              ' (Note: The seller is not responsible for any damage or loss incurred during shipping or delivery.)',
              style: TextStyle(
                fontSize: 13,
                //fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

           
          ],
          
        ),
      ),
    );
  }
}
