// Center(
//   child: Container(
//     height: 350,
//     width: 250,
//     margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
//     padding: const EdgeInsets.fromLTRB(10, 30, 20, 20),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromARGB(255, 26, 7, 7).withOpacity(0.2),
//           blurRadius: 5,
//           offset: Offset(0, 5),
//         ),
//       ],
//     ),
//     child: Table(
//       columnWidths: const {
//         0: FlexColumnWidth(3),
//         1: FlexColumnWidth(2),
//       },
//       children: [
//         TableRow(
//           children: [
//             TableCell(
//               child: Text(
//                 'Item name:',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 itemname,
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             TableCell(
//               child: Text(
//                 'Quantity:',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 '${quantity.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             TableCell(
//               child: Text(
//                 'Price:',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 '\$${amount.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             TableCell(
//               child: Text(
//                 'Total:',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 '\$${(amount*quantity).toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ),