// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWidgets;
// import 'invoice.dart';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';


// class InvoiceWidget extends StatelessWidget {
//   final String invoiceNumber;
//   final String customerName;
//   final List<InvoiceItem> items;

//   InvoiceWidget({
//     required this.invoiceNumber,
//     required this.customerName,
//     required this.items,
//   });
  

//   void _generateBill(BuildContext context) async {
//     final pdf = pdfWidgets.Document();

//     pdf.addPage(pdfWidgets.Page(
//       pageFormat: PdfPageFormat.a4,
//       margin: const pdfWidgets.EdgeInsets.all(16.0),
//       build: (context) {
//         return pdfWidgets.Column(
//           crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
//           children: [
//             pdfWidgets.Text('Invoice No: $invoiceNumber'),
//             pdfWidgets.SizedBox(height: 8.0),
//             pdfWidgets.Text('Customer Name: $customerName'),
//             pdfWidgets.SizedBox(height: 16.0),
//             pdfWidgets.Table.fromTextArray(
//               context: context,
//               data: <List<String>>[
//                 <String>['Item Name', 'Price', 'Quantity', 'Total'],
//                 ...items.map((item) => [
//                   item.name,
//                   '\$${item.price.toStringAsFixed(2)}',
//                   item.quantity.toString(),
//                   '\$${(item.price * item.quantity).toStringAsFixed(2)}',
//                 ]),
//               ],
//             ),
//           ],
//         );
//       },
//     ));

//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/$invoiceNumber.pdf');
//     await file.writeAsBytes(pdf.save() as List<int>);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Bill generated successfully!')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed:,
//           child: Text('Generate Bill'),
//         ),
//       ),
//     );
//   }
// }

