import 'package:flutter/material.dart';
import 'package:esm/db_helper.dart';
import 'item_form.dart';
import 'item_modal.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});
  //const Displaydatabase({Key? key}) : super(key: key);

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
  List<Item> _items = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUsers();
  // }

  @override
void didChangeDependencies() {
    super.didChangeDependencies();
     _fetchItems();
}

  Future<void> _fetchItems() async {
    final items = await DatabaseHelper.getItems();
    setState(() {
      _items = items;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => itemForm(),
              ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return Container(
              
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Color.fromARGB(255, 183, 170, 175),
                selectedTileColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Color.fromARGB(255, 247, 243, 243),
                    width: 1,
                  ),
                ),
                child: Container(
            
      
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => itemForm(
                              item: item), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedItem = result['item'] as Item;
                        final itemId = result['itemid'] as int;
                        await DatabaseHelper.updateItem(itemId, updatedItem);
                        await _fetchItems();
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.itemname),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${item.hsncode},\n ${item.itemspec},\n ${item.amount},\n ${item.img},\n ${item.supplierid},'),
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
                                  "Are you sure you want to delete this ${item.itemname}?"),
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
                          await DatabaseHelper.deleteItem(item.itemid!);
                          await _fetchItems();
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


