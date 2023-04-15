// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWidgets;



// class Invoicepageprint extends StatelessWidget {
//   String customername, itemname,name,email,business,business5;
//   int quantity, amount;
//   Invoicepageprint(
//       {required this.customername,
//       required this.name,
//       required this.itemname,
//       required this.quantity,
//       required this.amount,
//       required this.email,
//       required this.business,
//       required this.business5,
//       });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     // Color(0xffFFB900),
//                     // Color(0xffFF9800),
//                      Color.fromARGB(255, 238, 15, 52),
//                     Color.fromARGB(255, 187, 12, 179),

//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 20),
//                     Text(
//                       'Electronic Store',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 22, 21, 21),
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
                    
//                     Text(
//                       'Hampankatta,mangalore',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 245, 242, 242),
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'INVOICE',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 239, 239, 15),
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Divider(height: 32.0, thickness: 2.0),
//                     Text(
//                       'Customer Name: $customername',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 251, 246, 246),
//                         fontSize: 18,
//                         //fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Authorised person: $name',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       'Email: $email',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                      SizedBox(height: 20),
//                     Text(
//                       'Supplier Name: $business',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         //fontWeight: FontWeight.bold,
//                       ),
//                     ),
                   
//                     Text(
//                       'Email: $business5',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 height: 350,
//                 width: 250,
//                 margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
//                 padding: const EdgeInsets.fromLTRB(10, 30, 20, 20),
//                 decoration: BoxDecoration(
                  
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 26, 7, 7).withOpacity(0.2),
//                       blurRadius: 5,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Item name:',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       itemname,
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     //  Text(
//                     //   name,
//                     //   style: TextStyle(
//                     //     fontSize: 18,
//                     //   ),
//                     // ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Price:',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '\$${amount.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Quantity:',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '${quantity.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                      SizedBox(height: 20),
//                     Text(
//                       'Total:',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '\$${(amount*quantity).toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
// Text(
//               'Thank you for your purchase! Please visit us again!',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[700],
//               ),
//             ),

            
//           ],
//         ),
//       ),
//     );
//   }
// }



// /////tryyyyyyyyyyyyy
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'modals.dart';

// import 'db_helper.dart';

// class UserTableScreen extends StatefulWidget {
//   @override
//   _UserTableScreenState createState() => _UserTableScreenState();
// }

// class _UserTableScreenState extends State<UserTableScreen> {
//   List<User> users = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }

//   Future<void> fetchUsers() async {
//     List<User> userList = await DatabaseHelper.getUsers();
//     setState(() {
//       users = userList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users Table'),
//       ),
//       body: SingleChildScrollView(
//         child: DataTable(
//           columns: [
//             DataColumn(label: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Text('ID'),
//             )),
//             DataColumn(label: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Text('Name'),
//             )),
//             DataColumn(label: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Text('Age'),
//             )),
//             DataColumn(label: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Text('Email'),
//             )),
//           ],
//           rows: users.map((user) {
//             return DataRow(cells: [
//               DataCell(Text(user.id.toString())),
//               DataCell(Text(user.name)),
//               DataCell(Text(user.age.toString())),
//               DataCell(Text(user.email)),
//             ]);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }