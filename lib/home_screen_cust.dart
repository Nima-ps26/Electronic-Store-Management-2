
// import 'package:flutter/material.dart';  
// import 'db_helper_stock.dart';
// class HomeScreen1 extends StatefulWidget {
//   @override
//   State<HomeScreen1> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen1> {
//   List<Map<String, dynamic>> _allData = [];
//   bool _isloading = true;
// //get all data

//   void _refreshData() async{
//     final data = await SQLHelperS.getData();
//     setState(() {
//       _allData = data;
//       _isloading = false;
//     });
//   }
// @override
// void initstate() {
//   super.initState();
//   _refreshData();
// }


// //add data
// Future<void> _addData() async{
//   await SQLHelperS.createData(_businessController1.text, _gstController1.text, _authnameController1.text);
//   _refreshData();
// }

// //update data
// Future<void> _updateData(int id) async{
//   await SQLHelperS.createData(_businessController1.text, _gstController1.text, _authnameController1.text);
//   _refreshData();
// }

// //delete data
// void _deleteData(int id) async {
//   await SQLHelperS.deleteData(id);
//   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//     backgroundColor: Colors.purple,
//     content:Text("Data Deleted")
//   ));
//   _refreshData();
// }


// final TextEditingController _businessController1 = TextEditingController();
// final TextEditingController _gstController1 = TextEditingController();
// final TextEditingController _authnameController1 = TextEditingController();


// void showBottomSheet(int? id) async{
//   if(id!= null){
//     final existingData = _allData.firstWhere((element) => element['id']==id);
//     _businessController1.text = existingData['business1'];
//     _gstController1.text= existingData['gst1'];
//     _authnameController1.text =  existingData['authname1'];
  
//   }
//   showModalBottomSheet(
//     elevation: 5,
//     isScrollControlled: true,
//     context: context,
//      builder:(_)=>Container(
//       padding: EdgeInsets.only(
//         top: 30,
//         left: 15,
//         right: 15,
//         bottom: MediaQuery.of(context).viewInsets.bottom +50,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           TextField(
//             controller: _businessController1,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: "Item Name",

//             ),
//           ),
//           SizedBox(height: 3),
//           TextField(
//             controller: _gstController1,
//             maxLines: 1,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: "Quantity",

//             ),
//           ),
//           SizedBox(height: 3),
//           TextField(
//             controller: _authnameController1,
//             maxLines: 1,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: "Price",

//             ),
//           ),
       
         
//           SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
              
//               onPressed: () async {
//                 if(id == null){
//                   await _addData();
//                 }
//                 if(id!=null) {
//                   await _updateData(id);
//                 }
//                 _businessController1.text="";
//                 _gstController1.text="";
//                 _authnameController1.text ="";
                

//                 Navigator.of(context).pop();
//                 print("data added");
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(18),
                
//                 child: Text(id==null ? "Add data":"update",
              
//               style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
//               ),
             
//   ),
//               ),
//             ),
          
//         ],
//       ),
//      ),

//   );
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFECEAF4),
//       appBar: AppBar(
//         title: Text("Stock"),
//         backgroundColor: Colors.purple,
//       ),
//     body: _isloading
//     ? Center(
//       child: CircularProgressIndicator(),
//       )
//       :ListView.builder(
//         itemCount: _allData.length,
//         itemBuilder:(context, index)=>Card(
//           margin: EdgeInsets.all(15),
//           child: ListTile(
//               title: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5),
//               child: Text(
//                 _allData[index]['business1'],
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//                 ),
//                 ),
//                 subtitle:Text(_allData[index]['gst1']),
//                 leading:Text(_allData[index]['authname1']),
                

               
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         showBottomSheet(_allData[index]['id']);
//                       },
//                     icon: Icon(
//                       Icons.edit,
//                       color: Colors.deepOrange,
//                     ),
//                     ),
//                 IconButton(
//                       onPressed: () {
//                     _deleteData(_allData[index]['id']);
//                     },
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.deepOrange,

//                     ),
//                     ),
//                   ],
//                 ),
//             ),

//           ),

//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => showBottomSheet(null),
//           child: Icon(
//             Icons.add),
//             backgroundColor: Colors.purple,
//             foregroundColor: Colors.deepOrangeAccent, 
        
//         ),
//         );

//   }
// }