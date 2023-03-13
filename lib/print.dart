// import 'dart:io';
// import 'package:flutter/material.dart'; 
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'dart:typed_data';
// Future<void> generateInvoice() async  {
//   // create a new PDF document
//   final pdf = pw.Document();

//   // add a title to the invoice
//   pdf.addPage(
//     pw.Page(
//       build: (context) => pw.Center(
//         child: pw.Text(
//           'Invoice',
//           style: pw.TextStyle(fontSize: 20),
//         ),
//       ),
//     ),
//   );

//   // add the details of the invoice
//   pdf.addPage(
//     pw.MultiPage(
//       build: (context) => [
//         pw.Header(text: 'Invoice Details'),
//         pw.Table.fromTextArray(
//           headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//           data: <List<String>>[
//             <String>['Item', 'Quantity', 'Price'],
//             <String>['Item 1', '2', '\$10'],
//             <String>['Item 2', '1', '\$5'],
//             <String>['Item 3', '3', '\$15'],
//           ],
//         ),
//         pw.Padding(padding: pw.EdgeInsets.all(10)),
//         pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.end,
//           children: [
//             pw.Text('Total: \$30'),
//           ],
//         ),
//       ],
//     ),
//   );

//   // save the PDF document to a file
//   final file = File('invoice.pdf');
//   await file.writeAsBytes(await pdf.save());
// }
// // 