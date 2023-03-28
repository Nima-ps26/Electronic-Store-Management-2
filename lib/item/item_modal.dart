class Item {
  final int? itemid; // make id nullable
  final String itemname;
  final int hsncode;
  final String itemspec;
  final String img;
  final int amount;
  final String supplierid;

  Item({this.itemid, required this.itemname, required this.hsncode, required this.itemspec, required this.img,required this.amount, required this.supplierid});

  Map<String, dynamic> toMap() {
    return {
      if (itemid!= null) 'itemid': itemid, // only include id if it's not null
      'itemname': itemname, 
      'hsncode': hsncode,
     
      'itemspec': itemspec,
      'img': img,
      'amount': amount,
      'supplierid':supplierid

    };
  }

  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      itemid: map['itemid'],
      itemname: map['itemname'],
      hsncode: map['hsncode'],
      itemspec: map['itemspec'],
      img: map['img'],
      amount: map['amount'],
      supplierid: map['supplierid']
    );
  }
}