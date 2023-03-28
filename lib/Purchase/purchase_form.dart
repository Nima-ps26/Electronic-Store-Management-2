import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'purchase_display.dart';
import 'purchase_modal.dart';

class PurchaseForm extends StatefulWidget {
  final Purchase?
      purchase; //fetching the data from previous page for update and store inside model class object...

 

  const PurchaseForm({Key? key, this.purchase}) : super(key: key);

  @override
  _PurchaseFormState createState() => _PurchaseFormState();
}

class _PurchaseFormState extends State<PurchaseForm> {


  late TextEditingController itemnameController;
  late TextEditingController quantityController;
  late TextEditingController amountController;



        
         @override
void didChangeDependencies() {
    super.didChangeDependencies();

        
        
         //checking here if data received or not . if not null we will set to our field
    itemnameController = TextEditingController(text: widget.purchase?.itemname ?? '');
    quantityController = TextEditingController(text: widget.purchase?.quantity != null ? widget.purchase!.quantity.toString() : '');
 
    amountController = TextEditingController(text: widget.purchase?.amount != null ? widget.purchase!.amount.toString() : '');

  }

  @override
  void dispose() {
    itemnameController.dispose();
    quantityController.dispose();
    amountController.dispose();
    super.dispose();
  }

  

  void _handleSubmit() async {
    final purchase = Purchase(
        purchaseid: widget.purchase?.purchaseid, // use the id of the user being edited, if provided
        itemname: itemnameController.text,
        quantity: int.tryParse(quantityController.text) ?? 0,
       
        amount: int.tryParse(amountController.text) ?? 0,
       );

    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.purchase == null
                  ? 'Add Purchase'
                  : 'Update Purchase ${widget.purchase!.itemname}?'),
              content: Text(widget.purchase == null
                  ? 'Are you sure you want to add this purchase?'
                  : 'Are you sure you want to update ${widget.purchase!.itemname}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes')),
              ],
            ));

    if (shouldProceed) {
      int result;
      if (widget.purchase == null) {
        result = await DatabaseHelper.addPurchase(purchase);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Purchase added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          itemnameController.clear();
          quantityController.clear();
          amountController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add purchase.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updatePurchase(purchase.purchaseid!, purchase);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          itemnameController.clear();
          quantityController.clear();
          amountController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to update user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  //.............................................

  @override
  Widget build(BuildContext context) {
    return Container (
     decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
     ),
    child:Scaffold(
      appBar: AppBar(
        title: Text("Purchase"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
      child:Container (
         decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
      ),
        child: Column(
          children: [
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: itemnameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Item Name:',
                labelText: 'Item Name:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: quantityController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'Quantity',
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            
           
             TextField(
              controller: amountController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Amount',
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 35, // <-- SEE HERE
          ),
          
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('   Submit data   '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Displaydatabase()),
                );
              },
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('view Purchases'),
            ),
             SizedBox(
            height: 345, // <-- SEE HERE
          ),
          ],
        ),
      ),
      ),
    ));
  }
}









  