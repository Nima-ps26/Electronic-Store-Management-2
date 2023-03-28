import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'MyForm.dart';
import 'modal.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});
  //const Displaydatabase({Key? key}) : super(key: key);

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
  List<Customer> _customers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUsers();
  // }

  @override
void didChangeDependencies() {
    super.didChangeDependencies();
     _fetchCustomers();
}

  Future<void> _fetchCustomers() async {
    final customers = await DatabaseHelper.getCustomers();
    setState(() {
      _customers = customers;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
        backgroundColor: Colors.purple,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyForm(),
              ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 156, 9, 151),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _customers.length,
          itemBuilder: (context, index) {
            final customer = _customers[index];
            return Container(
              
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Color.fromARGB(255, 230, 181, 19),
                selectedTileColor: Color.fromARGB(255, 22, 16, 16),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Color.fromARGB(255, 247, 248, 247),
                    width: 3,
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
                          builder: (context) => MyForm(
                              customer: customer), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedCustomer = result['customer'] as Customer;
                        final customerId = result['custid'] as int;
                        await DatabaseHelper.updateCustomer(customerId, updatedCustomer);
                        await _fetchCustomers();
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(customer.businessname),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${customer.gstnumber},\n ${customer.authperson},\n ${customer.bcontact},\n ${customer.pcontact},\n ${customer.custemail},'),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirmDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Delete"),
                              backgroundColor: Color.fromARGB(255, 232, 224, 233),
                              content: Text(
                                  "Are you sure you want to delete this ${customer.businessname}?"),
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
                          await DatabaseHelper.deleteCustomer(customer.custid!);
                          await _fetchCustomers();
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


