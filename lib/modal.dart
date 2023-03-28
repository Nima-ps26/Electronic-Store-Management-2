class Customer {
  final int? custid; // make id nullable
  final String businessname;
  final int gstnumber;
  final String authperson;
  final String custemail;
  final int bcontact;
  final int pcontact;

  Customer({this.custid, required this.businessname, required this.gstnumber, required this.authperson,required this.bcontact,required this.pcontact, required this.custemail});

  Map<String, dynamic> toMap() {
    return {
      if (custid!= null) 'custid': custid, // only include id if it's not null
      'businessname': businessname, 
      'gstnumber': gstnumber,
      'custemail': custemail,
      'authperson': authperson,
      'bcontact': bcontact,
      'pcontact': pcontact
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(
      custid: map['custid'],
      businessname: map['businessname'],
      gstnumber: map['gstnumber'],
      authperson: map['authperson'],
      bcontact: map['bcontact'],
      pcontact: map['pcontact'],
      custemail: map['custemail'],
    );
  }
}