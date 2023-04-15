import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'purchase_form.dart';
import 'purchase_modal.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});
  //const Displaydatabase({Key? key}) : super(key: key);

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
  List<Purchase> _purchases = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUsers();
  // }

  @override
void didChangeDependencies() {
    super.didChangeDependencies();
     _fetchPurchases();
}

  Future<void> _fetchPurchases() async {
    final purchases = await DatabaseHelper.getPurchases();
    setState(() {
      _purchases = purchases;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PurchaseForm(),
              ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _purchases.length,
          itemBuilder: (context, index) {
            final purchase = _purchases[index];
            return Container(
              
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Color.fromARGB(255, 105, 179, 240),
                selectedTileColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Color.fromARGB(255, 41, 209, 209),
                    width: 1,
                  ),
                ),
                child: Container(
              //     decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 2,
              //       blurRadius: 5,
              //       offset: Offset(0, 3),
              //     ),
              //   ],
              // ),
      
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchaseForm(
                              purchase: purchase), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedPurchase = result['purchase'] as Purchase;
                        final purchaseId = result['purchaseid'] as int;
                        await DatabaseHelper.updatePurchase(purchaseId, updatedPurchase);
                        await _fetchPurchases();
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(purchase.itemname),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${purchase.quantity},\n ${purchase.amount},'),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirmDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text(
                                  "Are you sure you want to delete this ${purchase.itemname}?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () => Navigator.pop(context, false),
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirmDelete != null && confirmDelete) {
                          await DatabaseHelper.deletePurchase(purchase.purchaseid!);
                          await _fetchPurchases();
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


