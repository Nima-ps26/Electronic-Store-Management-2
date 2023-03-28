import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'display.dart';
import 'modal.dart';

class MyForm extends StatefulWidget {
  final Customer?
      customer; //fetching the data from previous page for update and store inside model class object...

 

  const MyForm({Key? key, this.customer}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {


  late TextEditingController businessnameController;
  late TextEditingController gstnumberController;
  late TextEditingController authpersonController;
  late TextEditingController bcontactController;
  late TextEditingController pcontactController;
  late TextEditingController ageController;
  late TextEditingController custemailController;


        
         @override
void didChangeDependencies() {
    super.didChangeDependencies();

        
        
         //checking here if data received or not . if not null we will set to our field
    businessnameController = TextEditingController(text: widget.customer?.businessname ?? '');
    gstnumberController = TextEditingController(text: widget.customer?.gstnumber != null ? widget.customer!.gstnumber.toString() : '');
    authpersonController = TextEditingController(text: widget.customer?.authperson ?? '');
    bcontactController = TextEditingController(text: widget.customer?.bcontact != null ? widget.customer!.bcontact.toString() : '');
    pcontactController = TextEditingController(text: widget.customer?.pcontact != null ? widget.customer!.pcontact.toString() : '');
    custemailController = TextEditingController(text: widget.customer?.custemail ?? '');
  }

  @override
  void dispose() {
    businessnameController.dispose();
    gstnumberController.dispose();
    authpersonController.dispose();
    bcontactController.dispose();
    pcontactController.dispose();
    custemailController.dispose();
    super.dispose();
  }

  

  void _handleSubmit() async {
    final customer = Customer(
        custid: widget.customer?.custid, // use the id of the user being edited, if provided
        businessname: businessnameController.text,
        gstnumber: int.tryParse(gstnumberController.text) ?? 0,
        authperson: authpersonController.text,
        bcontact: int.tryParse(bcontactController.text) ?? 0,
        pcontact: int.tryParse(pcontactController.text) ?? 0,
        custemail: custemailController.text);

    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.customer == null
                  ? 'Add Customer'
                  : 'Update Customer ${widget.customer!.businessname}?'),
              content: Text(widget.customer == null
                  ? 'Are you sure you want to add this customer?'
                  : 'Are you sure you want to update ${widget.customer!.businessname}?'),
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
      if (widget.customer == null) {
        result = await DatabaseHelper.addCustomer(customer);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Customer added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          businessnameController.clear();
          gstnumberController.clear();
          authpersonController.clear();
          bcontactController.clear();
          pcontactController.clear();
          custemailController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add customer.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateCustomer(customer.custid!, customer);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          businessnameController.clear();
          gstnumberController.clear();
          authpersonController.clear();
          bcontactController.clear();
          pcontactController.clear();
          custemailController.clear();
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
     
    child:Scaffold(
      appBar: AppBar(
        title: Text("Customer"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
      child:Container (
        
        child: Column(
        
          children: [
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: businessnameController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Business Name:',
                labelText: 'Business Name:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
            TextField(
              controller: gstnumberController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'GST number',
                labelText: 'GST number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
             TextField(
              controller: authpersonController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_2_rounded),
                hintText: 'Authorised persons name',
                labelText: 'Authorised persons name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, // <-- SEE HERE
          ),
             TextField(
              controller: bcontactController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Business contact number',
                labelText: 'Business contact number::',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25,
            width: 20, // <-- SEE HERE
          ),
            TextField(
              controller: pcontactController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly),
                hintText: 'Personal contact number:',
                labelText: 'Personal contact number:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 25, 
            width: 60,// <-- SEE HERE
          ),
             TextField(
              controller: custemailController,
                decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 40, // <-- SEE HERE
          ),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('   Submit data   '),
            ),
             SizedBox(
            height: 10, // <-- SEE HERE
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
              child: Text('view Customers'),
            ),

            SizedBox(
            height: 45, // <-- SEE HERE
          ),
          ],
        ),
      ),
      ),
    )));
  }
}









  