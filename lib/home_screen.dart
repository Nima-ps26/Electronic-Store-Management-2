import 'package:esm/db_helper.dart';
import 'package:flutter/material.dart';  

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];
  bool _isloading = true;
//get all data

  void _refreshData() async{
    final data = await SQLHelper.getData();
    setState(() {
      _allData = data;
      _isloading = false;
    });
  }
@override
void initstate() {
  super.initState();
  _refreshData();
}


//add data
Future<void> _addData() async{
  await SQLHelper.createData(_businessController.text, _gstController.text, _authnameController.text, _bcontactController.text, _pcontactController.text, _emailController.text);
  _refreshData();
}

//update data
Future<void> _updateData(int id) async{
  await SQLHelper.createData(_businessController.text, _gstController.text, _authnameController.text, _bcontactController.text, _pcontactController.text, _emailController.text);
  _refreshData();
}

//delete data
void _deleteData(int id) async {
  await SQLHelper.deleteData(id);
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    backgroundColor: Colors.purple,
    content:Text("Data Deleted")
  ));
  _refreshData();
}


final TextEditingController _businessController = TextEditingController();
final TextEditingController _gstController = TextEditingController();
final TextEditingController _authnameController = TextEditingController();
final TextEditingController _bcontactController = TextEditingController();
final TextEditingController _pcontactController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

void showBottomSheet(int? id) async{
  if(id!= null){
    final existingData = _allData.firstWhere((element) => element['id']==id);
    _businessController.text = existingData['business'];
    _gstController.text= existingData['gst'];
    _authnameController.text =  existingData['authname'];
    _bcontactController.text = existingData['bcontact'];
     _pcontactController.text= existingData['pcontact'];
      _emailController.text = existingData['email'];
  }
  showModalBottomSheet(
    elevation: 5,
    isScrollControlled: true,
    context: context,
     builder:(_)=>Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom +50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _businessController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Business Name",

            ),
          ),
          SizedBox(height: 3),
          TextField(
            controller: _gstController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Gst number",

            ),
          ),
          SizedBox(height: 3),
          TextField(
            controller: _authnameController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Authorised persons name:",

            ),
          ),
          SizedBox(height: 3),
          TextField(
            controller: _bcontactController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Business contact number::",

            ),
          ),SizedBox(height: 3),
          TextField(
            controller: _pcontactController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Personal contact number:",

            ),
          ),
          SizedBox(height: 3),
          TextField(
            controller: _emailController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email",

            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              
              onPressed: () async {
                if(id == null){
                  await _addData();
                }
                if(id!=null) {
                  await _updateData(id);
                }
                _businessController.text="";
                _gstController.text="";
                _authnameController.text ="";
                _bcontactController.text ="";
                _pcontactController.text="";
                _emailController.text ="";

                Navigator.of(context).pop();
                print("data added");
              },
              child: Padding(
                padding: EdgeInsets.all(18),
                
                child: Text(id==null ? "Add data":"update",
              
              style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
              ),
             
  ),
              ),
            ),
          
        ],
      ),
     ),

  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEAF4),
      appBar: AppBar(
        title: Text("Supplier"),
        backgroundColor: Colors.purple,
      ),
    body: _isloading
    ? Center(
      child: CircularProgressIndicator(),
      )
      :ListView.builder(
        itemCount: _allData.length,
        itemBuilder:(context, index)=>Card(
          margin: EdgeInsets.all(15),
          child: ListTile(
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                _allData[index]['business'],
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
                ),
                subtitle:Text(_allData[index]['gst']),
                leading:Text(_allData[index]['authname']),
                

               
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showBottomSheet(_allData[index]['id']);
                      },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.deepOrange,
                    ),
                    ),
                IconButton(
                      onPressed: () {
                    _deleteData(_allData[index]['id']);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.deepOrange,

                    ),
                    ),
                  ],
                ),
            ),

          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showBottomSheet(null),
          child: Icon(
            Icons.add),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.deepOrangeAccent, 
        
        ),
        );

  }
}