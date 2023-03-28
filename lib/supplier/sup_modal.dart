class Supplier {
  final int? supid; // make id nullable
  final String supplierid;
  final String businessname1;
  final int gstnumber1;
  final String authperson1;
  final int bcontact1;
  final int pcontact1;
  final String custemail1;

  Supplier({this.supid,required this.supplierid,required this.businessname1 , required this.gstnumber1, required this.authperson1,required this.bcontact1,required this.pcontact1, required this.custemail1});

  Map<String, dynamic> toMap() {
    return {
      if (supid!= null) 'supid': supid, // only include id if it's not null
      'supplierid ':supplierid ,
      'businessname1': businessname1, 
      'gstnumber1': gstnumber1,
      'authperson1': authperson1,
      'bcontact1': bcontact1,
      'pcontact1': pcontact1,
      'custemail1': custemail1,
    };
  }

  static Supplier fromMap(Map<String, dynamic> map) {
    return Supplier(
      supid: map['supid'],
      supplierid :map['supplierid '],
      businessname1: map['businessname1'],
      gstnumber1: map['gstnumber1'],
      authperson1: map['authperson1'],
      bcontact1: map['bcontact1'],
      pcontact1: map['pcontact1'],
      custemail1: map['custemail1'],
    );
  }
}