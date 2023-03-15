import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dashhboard.dart';
// SalesTransaction class representing a single transaction
class SalesTransaction {
  final DateTime date;
  final String productName;
  final int quantity;
  final double price;

  SalesTransaction({
    required this.date,
    required this.productName,
    required this.quantity,
    required this.price, required List transactions,
  });
}

// ReportScreen widget that displays the report
class ReportScreen extends StatelessWidget {
  final List<SalesTransaction> transactions;

  ReportScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    double totalRevenue = 0.0;
    int totalQuantity = 0;
    List<DataRow> rows = [];

    // Calculate total revenue and quantity and create a DataRow for each transaction
    for (var transaction in transactions) {
      double revenue = transaction.quantity * transaction.price;
      totalRevenue += revenue;
      totalQuantity += transaction.quantity;

      rows.add(
        DataRow(
          cells: [
            DataCell(Text(DateFormat('MMM d, yyyy').format(transaction.date))),
            DataCell(Text(transaction.productName)),
            DataCell(Text('${transaction.quantity}')),
            DataCell(Text(NumberFormat.currency(symbol: '\$').format(transaction.price))),
            DataCell(Text(NumberFormat.currency(symbol: '\$').format(revenue))),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sales Report',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Revenue: ${NumberFormat.currency(symbol: '\$').format(totalRevenue)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Quantity Sold: $totalQuantity',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              DataTable(
                columns: [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Product')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Revenue')),
                ],
                rows: rows,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
