import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'sup_form.dart';
import 'sup_modal.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});
  //const Displaydatabase({Key? key}) : super(key: key);

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
  List<Supplier> _suppliers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUsers();
  // }

  @override
void didChangeDependencies() {
    super.didChangeDependencies();
     _fetchSuppliers();
}

  Future<void> _fetchSuppliers() async {
    final suppliers = await DatabaseHelper.getSuppliers();
    setState(() {
      _suppliers = suppliers;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suppliers'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => supForm(),
              ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _suppliers.length,
          itemBuilder: (context, index) {
            final supplier = _suppliers[index];
            return Container(
              
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Color.fromARGB(255, 171, 179, 23),
                selectedTileColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Container(
            
      
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => supForm(
                              supplier: supplier), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedSupplier = result['supplier'] as Supplier;
                        final supplierId = result['supid'] as int;
                        await DatabaseHelper.updateSupplier(supplierId, updatedSupplier);
                        await _fetchSuppliers();
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(supplier.businessname1),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${supplier.supplierid},\n ${supplier.gstnumber1},\n ${supplier.authperson1},\n ${supplier.bcontact1},\n ${supplier.pcontact1},\n ${supplier.custemail1},'),
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
                                  "Are you sure you want to delete this ${supplier.businessname1}?"),
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
                          await DatabaseHelper.deleteSupplier(supplier.supid!);
                          await _fetchSuppliers();
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


