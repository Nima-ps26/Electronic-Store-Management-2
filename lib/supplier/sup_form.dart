import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'sup_display.dart';
import 'sup_modal.dart';

class supForm extends StatefulWidget {
  final Supplier?
      supplier; //fetching the data from previous page for update and store inside model class object...

 

  const supForm({Key? key, this.supplier}) : super(key: key);

  @override
  _supFormState createState() => _supFormState();
}

class _supFormState extends State<supForm> {

  late TextEditingController supplieridController;
  late TextEditingController businessnameController1;
  late TextEditingController gstnumberController1;
  late TextEditingController authpersonController1;
  late TextEditingController bcontactController1;
  late TextEditingController pcontactController1;
  late TextEditingController ageController1;
  late TextEditingController custemailController1;


        
         @override
void didChangeDependencies() {
    super.didChangeDependencies();

        
        
         //checking here if data received or not . if not null we will set to our field
    supplieridController = TextEditingController(text: widget.supplier?.supplierid ?? '');
    businessnameController1 = TextEditingController(text: widget.supplier?.businessname1 ?? '');
    gstnumberController1 = TextEditingController(text: widget.supplier?.gstnumber1 != null ? widget.supplier!.gstnumber1.toString() : '');
    authpersonController1 = TextEditingController(text: widget.supplier?.authperson1 ?? '');
    bcontactController1 = TextEditingController(text: widget.supplier?.bcontact1 != null ? widget.supplier!.bcontact1.toString() : '');
    pcontactController1 = TextEditingController(text: widget.supplier?.pcontact1 != null ? widget.supplier!.pcontact1.toString() : '');
    custemailController1 = TextEditingController(text: widget.supplier?.custemail1 ?? '');
  }

  @override
  void dispose() {
    supplieridController.dispose();
    businessnameController1.dispose();
    gstnumberController1.dispose();
    authpersonController1.dispose();
    bcontactController1.dispose();
    pcontactController1.dispose();
    custemailController1.dispose();
    super.dispose();
  }

  

  void _handleSubmit() async {
    final supplier = Supplier(
        supid: widget.supplier?.supid, // use the id of the user being edited, if provided
        supplierid: supplieridController.text,
        businessname1: businessnameController1.text,
        gstnumber1: int.tryParse(gstnumberController1.text) ?? 0,
        authperson1: authpersonController1.text,
        bcontact1: int.tryParse(bcontactController1.text) ?? 0,
        pcontact1: int.tryParse(pcontactController1.text) ?? 0,
        custemail1: custemailController1.text);

    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.supplier == null
                  ? 'Add Supplier'
                  : 'Update Supplier ${widget.supplier!.businessname1}?'),
              content: Text(widget.supplier == null
                  ? 'Are you sure you want to add this supplier?'
                  : 'Are you sure you want to update ${widget.supplier!.businessname1}?'),
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
      if (widget.supplier == null) {
        result = await DatabaseHelper.addSupplier(supplier);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Supplier added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          supplieridController.clear();
          businessnameController1.clear();
          gstnumberController1.clear();
          authpersonController1.clear();
          bcontactController1.clear();
          pcontactController1.clear();
          custemailController1.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add supplier.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateSupplier(supplier.supid!, supplier);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          supplieridController.clear();
          businessnameController1.clear();
          gstnumberController1.clear();
          authpersonController1.clear();
          bcontactController1.clear();
          pcontactController1.clear();
          custemailController1.clear();
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
        title: Text("Supplier"),
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
              controller: supplieridController,
               decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'Supplier id',
                labelText: 'Supplier id',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(
            height: 22, // <-- SEE HERE
          ),
            TextField(
              controller: businessnameController1,
               decoration: const InputDecoration(
                icon: const Icon(Icons.local_post_office),
                hintText: 'Business Name:',
                labelText: 'Business Name:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height:22, // <-- SEE HERE
          ),
            TextField(
              controller: gstnumberController1,
               decoration: const InputDecoration(
                icon: const Icon(Icons.numbers),
                hintText: 'GST number',
                labelText: 'GST number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 22, // <-- SEE HERE
          ),
             TextField(
              controller: authpersonController1,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_2_rounded),
                hintText: 'Authorised persons name',
                labelText: 'Authorised persons name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 22, // <-- SEE HERE
          ),
             TextField(
              controller: bcontactController1,
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Business contact number',
                labelText: 'Business contact number::',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 22, // <-- SEE HERE
          ),
            TextField(
              controller: pcontactController1,
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly),
                hintText: 'Personal contact number:',
                labelText: 'Personal contact number:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 22, // <-- SEE HERE
          ),
             TextField(
              controller: custemailController1,
                decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
            height: 22, // <-- SEE HERE
          ),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
            
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground
            ),
              child: Text('     Submit       '),
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
              child: Text('view Suppliers'),
            ),
          ],
        ),
      ),
      ),
    ));
  }
}









  