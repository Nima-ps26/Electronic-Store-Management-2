import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'item_display.dart';
import 'item_modal.dart';
import 'item_display.dart';

class itemForm extends StatefulWidget {
  final Item?
      item; //fetching the data from previous page for update and store inside model class object...

 

  const itemForm({Key? key, this.item}) : super(key: key);

  @override
  _itemFormState createState() => _itemFormState();
}

class _itemFormState extends State<itemForm> {
  late TextEditingController itemnameController;
  late TextEditingController hsncodeController;
  late TextEditingController itemspecController;
  late TextEditingController amountController;
  late TextEditingController supplieridController;
  late TextEditingController imgController;

        
         @override
void didChangeDependencies() {
    super.didChangeDependencies();

        
        
         //checking here if data received or not . if not null we will set to our field
    itemnameController = TextEditingController(text: widget.item?.itemname ?? '');
    hsncodeController = TextEditingController(text: widget.item?.hsncode != null ? widget.item!.hsncode.toString() : '');
    itemspecController = TextEditingController(text: widget.item?.itemspec ?? '');
    amountController = TextEditingController(text: widget.item?.amount != null ? widget.item!.amount.toString() : '');
    supplieridController = TextEditingController(text: widget.item?.supplierid ?? '');
    imgController = TextEditingController(text: widget.item?.img ?? '')  ;
  }

  @override
  void dispose() {
    itemnameController.dispose();
    hsncodeController.dispose();
    itemspecController.dispose();
    amountController.dispose();
    supplieridController.dispose();
    imgController.dispose();
    super.dispose();
  }

  

  void _handleSubmit() async {
    final item = Item(
        itemid: widget.item?.itemid, // use the id of the user being edited, if provided
        itemname: itemnameController.text,
        hsncode: int.tryParse(hsncodeController.text) ?? 0,
        itemspec: itemspecController.text,
        amount: int.tryParse(amountController.text) ?? 0,
        supplierid: supplieridController.text,
        img: imgController.text);
        
    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.item == null
                  ? 'Add Item'
                  : 'Update Item ${widget.item!.itemname}?'),
              content: Text(widget.item == null
                  ? 'Are you sure you want to add this item?'
                  : 'Are you sure you want to update ${widget.item!.itemname}?'),
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
      if (widget.item == null) {
        result = await DatabaseHelper.addItem(item);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
         
          itemnameController.clear();
          hsncodeController.clear();
          itemspecController.clear();
          amountController.clear();
          supplieridController.clear();
          imgController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add item.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateItem(item.itemid!, item);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          
          itemnameController.clear();
          hsncodeController.clear();
          itemspecController.clear();
          amountController.clear();
          supplieridController.clear();
          imgController.clear();
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
        title: Text("Item"),
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
            height: 40, // <-- SEE HERE
          ),
         
            TextField(
              controller: itemnameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.production_quantity_limits),
                hintText: 'Item Name:',
                labelText: 'Item Name:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: hsncodeController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'HSN code',
                labelText: 'HSN code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
             TextField(
              controller: itemspecController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_2_rounded),
                hintText: 'Item specification',
                labelText: 'Item specification',
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
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: imgController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly),
                hintText: 'Validity',
                labelText: 'Validity',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
             TextField(
              controller: supplieridController,
                decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Supplier id',
                labelText: 'Supplier id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('   Submit  '),
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
              child: Text('view Items'),
            ),
            SizedBox(
            height: 50, // <-- SEE HERE
          ),
          ],
        ),
      ),
      ),
    ));
  }
}









  