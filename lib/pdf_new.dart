// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWidgets;

// class Invoicepageprint extends StatelessWidget {
//   String customerName, itemName, name, email;
//   int quantity;
//   double amount;

//   Invoicepageprint({
//     required this.customerName,
//     required this.name,
//     required this.itemName,
//     required this.quantity,
//     required this.amount,
//     required this.email,
//   });

//   final pdf = pdfWidgets.Document();

//   @override
//   Widget build(BuildContext context) {
//     // Add page to the pdf
//     pdf.addPage(pdfWidgets.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (context) {
//         // Create the invoice as a widget
//         return pdfWidgets.Container(
//           padding: pdfWidgets.EdgeInsets.all(20),
//           child: pdfWidgets.Column(
//             crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
//             children: [
//               pdfWidgets.Row(
//                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pdfWidgets.Text(
//                     'INVOICE',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 30,
//                       fontWeight: pdfWidgets.FontWeight.bold,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     'Date: ${DateTime.now().toString()}',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//               pdfWidgets.SizedBox(height: 20),
//               pdfWidgets.Text(
//                 'Bill To:',
//                 style: pdfWidgets.TextStyle(
//                   fontSize: 20,
//                   fontWeight: pdfWidgets.FontWeight.bold,
//                 ),
//               ),
//               pdfWidgets.SizedBox(height: 10),
//               pdfWidgets.Text(
//                 '$customerName',
//                 style: pdfWidgets.TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               pdfWidgets.Text(
//                 '$email',
//                 style: pdfWidgets.TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               pdfWidgets.SizedBox(height: 20),
//               pdfWidgets.Row(
//                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pdfWidgets.Text(
//                     'Item name',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 20,
//                       fontWeight: pdfWidgets.FontWeight.bold,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     'Price',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 20,
//                       fontWeight: pdfWidgets.FontWeight.bold,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     'Quantity',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 20,
//                       fontWeight: pdfWidgets.FontWeight.bold,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     'Total',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 20,
//                       fontWeight: pdfWidgets.FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               pdfWidgets.Divider(height: 30),
//               pdfWidgets.Row(
//                 mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pdfWidgets.Text(
//                     '$itemName',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     '\$${amount.toStringAsFixed(2)}',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     '$quantity',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   pdfWidgets.Text(
//                     '\$${(amount * quantity).toStringAsFixed(2)}',
//                     style: pdfWidgets.TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//     );
//   }
// }
                