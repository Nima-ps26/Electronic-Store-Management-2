class Purchase {
  final int? purchaseid; // make id nullable
  final String itemname;
  final int quantity;
  final int amount;
 

  Purchase({this.purchaseid, required this.itemname, required this.quantity, required this.amount});

  Map<String, dynamic> toMap() {
    return {
      if (purchaseid!= null) 'purchaseid': purchaseid, // only include id if it's not null
      'itemname': itemname, 
      'quantity': quantity,
      'amount': amount,
    };
  }

  static Purchase fromMap(Map<String, dynamic> map) {
    return Purchase(
      purchaseid: map['purchaseid'],
      itemname: map['itemname'],
      quantity: map['quantity'],
      amount: map['amount'],
    );
  }
}