import 'package:flutter/material.dart';

class InvoiceWidget extends StatelessWidget {
  final String invoiceNumber;
  final String customerName;
  final List<InvoiceItem> items;

  InvoiceWidget({required this.invoiceNumber, required this.customerName, required this.items});

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;
    double taxRate = 0.05;
    double taxAmount = 0.0;
    double total = 0.0;
    
    // Calculate subtotal, taxes, and total
    for (InvoiceItem item in items) {
      subtotal += item.price * item.quantity;
    }
    taxAmount = subtotal * taxRate;
    total = subtotal + taxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bill'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Company logo
            //Image.network('https://www.example.com/logo.png'),
            SizedBox(height: 16.0),

            // Customer details
            Text('Customer: $customerName'),
            SizedBox(height: 8.0),

            // Invoice items
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(item.name),
                    Text('\$${item.price} x ${item.quantity}'),
                    Text('\$${item.price * item.quantity}'),
                  ],
                );
              },
            ),
            SizedBox(height: 8.0),

            // Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Subtotal:'),
                SizedBox(width: 16.0),
                Text('\$${subtotal.toStringAsFixed(2)}'),
              ],
            ),

            // Taxes
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Tax (${(taxRate * 100).toStringAsFixed(0)}%):'),
                SizedBox(width: 16.0),
                Text('\$${taxAmount.toStringAsFixed(2)}'),
              ],
            ),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total:'),
                SizedBox(width: 16.0),
                Text('\$${total.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceItem {
  final String name;
  final double price;
  final int quantity;
  final String customername;
  InvoiceItem({required this.customername, required this.name, required this.price, required this.quantity});
}
class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final TextEditingController _customernameController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final List<InvoiceItem> _items = [];

  void _addItem() {
    final String customername = _customernameController.text;
    final String name = _itemNameController.text.trim();
    final double price = double.tryParse(_itemPriceController.text.trim()) ?? 0.0;
    final int quantity = int.tryParse(_itemQuantityController.text.trim()) ?? 0;
    if (name.isNotEmpty && price > 0 && quantity > 0) {
      setState(() {
        _items.add(InvoiceItem(customername:customername,name: name, price: price, quantity: quantity));
        _itemNameController.clear();
        _itemPriceController.clear();
        _itemQuantityController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Invoice'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            TextField(
              controller: _customernameController,
              decoration: InputDecoration(
                labelText: 'Customer name',
                
              ),
            ),
            
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: 'Item name',
                
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _itemPriceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Item price',
                prefixText: '\$',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _itemQuantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Item quantity',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addItem,
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
              child: Text('Add item'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price} x ${item.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _items.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoiceWidget(
                      invoiceNumber: '12345',
                      customerName: 'John Smith',
                      items: _items,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white, // foreground
  ),
              child: Text('Generate invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
