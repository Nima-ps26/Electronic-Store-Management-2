// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CustomerTable extends StatefulWidget {
//   @override
//   _CustomerTableState createState() => _CustomerTableState();
// }

// class _CustomerTableState extends State<CustomerTable> {
//   List<dynamic> customers = [];

//   Future<void> _getCustomers() async {
//     String url = "https://example.com/api/customers";
//     var response = await http.get(Uri.parse(url));
//     setState(() {
//       customers = json.decode(response.body);
//     });
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _getCustomers();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Customer Table"),
//       ),
//       body: ListView.builder(
//         itemCount: customers.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: ListTile(
//               title: Text(customers[index]['name']),
//               subtitle: Text(customers[index]['email']),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
