class MyAddress {
  MyAddress(this.titleName,this.countryName,this.streetAddress,this.town,this.postCode, this.email, this.phoneNo,this.isDefaultShippingAddress);

  String titleName, countryName,streetAddress,town,postCode, email, phoneNo;
  bool isDefaultShippingAddress;
}

List<MyAddress> myAddressesDemoData = [
  MyAddress('Sergio Pro', 'Delaware','6391 Elgin St','Celina','10299', 'sergiopro123@gmail.com', '+00123456789',true),
  MyAddress('Sergio Pro', 'Pakistan' ,'3517 W','Islamabad' ,'57867', 'test123@gmail.com', '+12345678900',false),
  MyAddress('Sergio Pro', 'Pakistan','Bukit Batok Street 41','Islamabad',' 361025', 'test@gmail.com', '+45678900123',false),
];
