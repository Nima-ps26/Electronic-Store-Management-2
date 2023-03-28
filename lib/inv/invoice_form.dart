import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'package:esm/inv/invoice_display.dart';
import 'package:esm/inv/invoice_form.dart';
import 'package:esm/db_helper.dart';
import 'package:esm/inv/invoice_modal.dart';
import 'package:esm/inv_gen.dart';

class InvoiceForm extends StatefulWidget {
  final Invoice?
      invoice; //fetching the data from previous page for update and store inside model class object...

 

  const InvoiceForm({Key? key, this.invoice}) : super(key: key);

  @override
  _InvoiceFormState createState() => _InvoiceFormState();

}

class _InvoiceFormState extends State<InvoiceForm> {
  String name='';
  String email='';
  String id='';
  String business='';
  String business5='';

  late TextEditingController customernameController;
  late TextEditingController itemnameController;
  late TextEditingController quantityController;
  late TextEditingController amountController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController idController;
  late TextEditingController businessController;
  late TextEditingController business5Controller;
  //var nameController;



        
         @override
void didChangeDependencies() {
    super.didChangeDependencies();

        
        
         //checking here if data received or not . if not null we will set to our field
    customernameController = TextEditingController(text: widget.invoice?.customername ?? '');
    nameController = TextEditingController(text: widget.invoice?.name ?? '');
    itemnameController = TextEditingController(text: widget.invoice?.itemname ?? '');
    quantityController = TextEditingController(text: widget.invoice?.quantity != null ? widget.invoice!.quantity.toString() : '');
    amountController = TextEditingController(text: widget.invoice?.amount != null ? widget.invoice!.amount.toString() : '');
    emailController = TextEditingController(text: widget.invoice?.email??'');
    idController = TextEditingController(text: widget.invoice?.id??'');
    businessController = TextEditingController(text: widget.invoice?.business??'');
    business5Controller = TextEditingController(text: widget.invoice?.business5??'');

  }

  @override
  void dispose() {
    customernameController.dispose();
    nameController.dispose();
    itemnameController.dispose();
    quantityController.dispose();
    amountController.dispose();
    emailController.dispose();
    idController.dispose();
    businessController.dispose();
    business5Controller.dispose();
    super.dispose();
  }

  

  void _handleSubmit() async {
    final invoice = Invoice(
        invoiceid: widget.invoice?.invoiceid, // use the id of the user being edited, if provided
        customername: customernameController.text,
        name: nameController.text,
        itemname: itemnameController.text,
        quantity: int.tryParse(quantityController.text) ?? 0,
       
        amount: int.tryParse(amountController.text) ?? 0,
        email: emailController.text,
        id: idController.text,
        business: businessController.text,
        business5: business5Controller.text,
       );

    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.invoice == null
                  ? 'Add Invoice'
                  : 'Update Invoice ${widget.invoice!.itemname}?'),
              content: Text(widget.invoice == null
                  ? 'Are you sure you want to add this invoice?'
                  : 'Are you sure you want to update ${widget.invoice!.itemname}?'),
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
      if (widget.invoice == null) {
        result = await DatabaseHelper.addInvoice(invoice);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invoice added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          // itemnameController.clear();
          // quantityController.clear();
          // amountController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add invoice.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateInvoice(invoice.invoiceid!, invoice);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          // customernameController.clear();
          // itemnameController.clear();
          // quantityController.clear();
          // amountController.clear();
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
        title: Text("Invoice"),
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
            height: 15, // <-- SEE HERE
          ),
           TextField(
            // onTap: (){
            //   print('Tapped');
            //   print(customernameController.text);

            //   final query = 'SELECT bcontact FROM customers WHERE businessname = ? ';
            //   final result = DatabaseHelper.rawQuery(query,[customernameController.text]);

            //   print('after query');

            //   print(result);

            // },
              controller: customernameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Customer Name:',
                labelText: 'Customer Name:',
                border: OutlineInputBorder(),
              ),
              
            ),
            
             SizedBox(
            height: 15, // <-- SEE HERE
          ),
            TextFormField(
               onTap: ()async{
              print('Tapped');
             // print(customernameController.text);

              final query = 'SELECT authperson FROM customers WHERE businessname = ? ';
              final result = await DatabaseHelper.rawQuery(query,[customernameController.text]);
              print(result);
              final contact =result.first['authperson'];
              nameController.text=contact;
              print('after query');

              print(contact);
              if(result.isNotEmpty){
                setState(() {
                  nameController.text=result.first['authperson'];
                });
              }
              else{
                nameController.text='';
              }

            },
              controller:nameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Authorised person name',
                labelText: 'Authorised person name',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(
            height: 15, // <-- SEE HERE
          ),
            TextFormField(
               onTap: ()async{
              print('Tapped');
             // print(customernameController.text);

              final query = 'SELECT custemail FROM customers WHERE businessname = ? ';
              final result1 = await DatabaseHelper.rawQuery(query,[customernameController.text]);
              print(result1);
              final contact1 =result1.first['custemail'];
              emailController.text=contact1;
              print('after query');

              print(contact1);
              if(result1.isNotEmpty){
                setState(() {
                  emailController.text=result1.first['custemail'];
                });
              }
              else{
                emailController.text='';
              }

            },
              controller:emailController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'email id',
                labelText: 'email id',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(
            height: 15, // <-- SEE HERE
          ),
            TextField(
              controller: itemnameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Item Name',
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 15, // <-- SEE HERE
          ),
            TextFormField(
               onTap: ()async{
              print('Tapped');
             // print(customernameController.text);

              final query = 'SELECT supplierid FROM items WHERE itemname = ? ';
              final result3 = await DatabaseHelper.rawQuery(query,[itemnameController.text]);
              print(result3);
              final contact3 =result3.first['supplierid'];
              idController.text=contact3;
              print('after query');

              print(contact3);
              if(result3.isNotEmpty){
                setState(() {
                  idController.text=result3.first['supplierid'];
                });
              }
              else{
                idController.text='';
              }

            },
              controller:idController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Supplier id',
                labelText: 'Supplier id',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(
            height: 15, // <-- SEE HERE
          ),
               TextFormField(
               onTap: ()async{
              print('Tapped');
             // print(customernameController.text);

              final query = 'SELECT businessname1 FROM suppliers WHERE supplierid = ? ';
              final result4 = await DatabaseHelper.rawQuery(query,[idController.text]);
              print(result4);
              final contact4 =result4.first['businessname1'];
              businessController.text=contact4;
              print('after query');

              print(contact4);
              if(result4.isNotEmpty){
                setState(() {
                  businessController.text=result4.first['businessname1'];
                });
              }
              else{
                businessController.text='';
              }

            },
              controller:businessController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Supplier name',
                labelText: 'Supplier name',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(
            height: 15, // <-- SEE HERE
          ),
               TextFormField(
               onTap: ()async{
              print('Tapped');
             // print(customernameController.text);

              final query = 'SELECT custemail1 FROM suppliers WHERE supplierid = ? ';
              final result5 = await DatabaseHelper.rawQuery(query,[idController.text]);
              print(result5);
              final contact5 =result5.first['custemail1'];
              business5Controller.text=contact5;
              print('after query');

              print(contact5);
              if(result5.isNotEmpty){
                setState(() {
                  business5Controller.text=result5.first['custemail1'];
                });
              }
              else{
                business5Controller.text='';
              }

            },
              controller:business5Controller,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'email id',
                labelText: 'email id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
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
            height: 15, // <-- SEE HERE
          ),
            
           
             TextField(
              controller: amountController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Amount',
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 55, // <-- SEE HERE
          ),
          
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('   Submit data  '),
            ),
            SizedBox(
            height: 5, // <-- SEE HERE
          ),
                    //   ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Displaydatabases()),
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //           primary: Colors.purple, // background
                    //           onPrimary: Colors.white, // foreground
                    //   ),
                    //     child: Text(' view Invoices '),
                    //   ),
                    //   SizedBox(
                    //   height: 5, // <-- SEE HERE
                    // ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Invoicepageprint(customername: customernameController.text,name: nameController.text,email:emailController.text,business:businessController.text,business5:business5Controller.text,itemname: itemnameController.text,quantity: int.tryParse(quantityController.text) ?? 0,amount:int.tryParse(amountController.text) ?? 0,)),
                );
              },
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('Generate invoice'),
            ),
            SizedBox(
            height: 215, // <-- SEE HERE
          ),
          ],
        ),
      ),
      ),
    ));
  }
}









  