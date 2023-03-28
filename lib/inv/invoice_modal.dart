import 'package:esm/inv/invoice_display.dart';
import 'package:esm/inv/invoice_form.dart';
import 'package:esm/db_helper.dart';
class Invoice {
  final int? invoiceid; // make id nullable
  final String customername;
  final String name;
  final String email;
  final String id;
  final String itemname;
  final int quantity;
  final int amount;
  final String business;
  final String business5;
  final int total=0;
 

  Invoice({this.invoiceid, required this.customername,required this.name,required this.email, required this.itemname, required this.id,required this.business,required this.business5,required this.quantity, required this.amount});

  Map<String, dynamic> toMap() {
    return {
      if (invoiceid!= null) 'invoiceid': invoiceid, // only include id if it's not null
      'customername': customername, 
      'name':'name',
      'email':'email',
      'itemname':itemname,
      'id':id,
      'quantity': quantity,
      'amount': amount,
      'business':business,
      'business5':business5,
    };
  }

  static Invoice fromMap(Map<String, dynamic> map) {
    return Invoice(
      invoiceid: map['invoiceid'],
      customername: map['customername'],
      name: map['name'],
      email: map['email'],
      itemname: map['itemname'],
      id:map['id'],
      business5: map['business5'],
      quantity: map['quantity'],
      amount: map['amount'],
      business:map['business']
    );
  }
}