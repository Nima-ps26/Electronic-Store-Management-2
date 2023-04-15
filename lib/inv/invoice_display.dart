import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'package:esm/inv/invoice_display.dart';
import 'package:esm/inv/invoice_form.dart';
import 'package:esm/inv/invoice_modal.dart';

class Displaydatabases extends StatefulWidget {
  const Displaydatabases({Key? key}) : super(key: key);

  @override
  State<Displaydatabases> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabases> {
  List<Invoice> _invoices = [];
  double _totalSales = 0;
  double _totalSales1 = 0;
  int _totalItemsSold = 0;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchInvoices();
  }

  Future<void> _fetchInvoices() async {
    final invoices = await DatabaseHelper.getInvoices();
    double totalSales = 0;
    double totalSales1 = 0;
    int totalItemsSold = 0;
    for (final invoice in invoices) {
      totalSales1 +=invoice.amount*invoice.quantity;
      totalSales += invoice.amount * invoice.quantity + (20 * invoice.quantity);
      totalItemsSold += invoice.quantity;
    }
    setState(() {
      _invoices = invoices;
      _totalSales = totalSales;
      _totalSales1 = totalSales1;
      _totalItemsSold = totalItemsSold;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InvoiceForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: ListView.builder(
            itemCount: _invoices.length + 3, // add one for the total sales tile
            itemBuilder: (context, index) {
              if (index == _invoices.length) {
                SizedBox(
            height: 35, // <-- SEE HERE
          );
                // display total sales tile
                return ListTile(
                  
                  title: Text('Total Sales of the company (with profit):', style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                  trailing: Text('\$${_totalSales.toStringAsFixed(2)}',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                );
              }
               else if (index == _invoices.length+1) {
           
                // display total sales tile
                return ListTile(
                  
                  title: Text('Total Sales of the company',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                  trailing: Text('\$${_totalSales1.toStringAsFixed(2)}',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                );
              }
              else if (index == _invoices.length + 2) {
                // display total items sold tile
                return ListTile(
                  title: Text('Total Items Sold:',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                  trailing: Text('$_totalItemsSold',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white)),
                );
              }
              
              final invoice = _invoices[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Color.fromARGB(255, 255, 255, 255) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTileTheme(
                  tileColor: Color.fromARGB(255, 217, 236, 14),
                  selectedTileColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                  child: Container(
                    child: ListTile(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoiceForm(
                              invoice: invoice,
                            ),
                          ),
                        );
                        if (result != null) {
                          final updatedInvoice =
                              result['invoice'] as Invoice;
                          final invoiceId = result['invoiceid'] as int;
                          await DatabaseHelper.updateInvoice(
                              invoiceId, updatedInvoice);
                          await _fetchInvoices();
                        }
                      },
                      subtitle: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          
                          '${invoice.customername}      ${invoice.itemname}     ${invoice.quantity}     ${invoice.amount}     ${invoice.quantity * invoice.amount}  ${invoice.amount * invoice.quantity + (20 * invoice.quantity)}',style: TextStyle(fontFamily: 'OpenSans',fontSize: 15,color: Colors.black)),
  ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    )
    );
  }
}