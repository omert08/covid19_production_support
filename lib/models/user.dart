class User{
  final String uid;
  final String firstName;
  final String lastName;
  final String type;
  final String username;
  final String country;
  final String state;
  final String city;
  final Map<String, double> userLocation;


  User({this.uid, this.firstName, this.lastName, this.type, this.username, this.country, this.state, this.city, this.userLocation});

}

class Manufacturer extends User{
  final String manufacturingType;

  Manufacturer({this.manufacturingType});

}

class MedicalStaff extends User{
  
  final String hospitalName;
  MedicalStaff({this.hospitalName});

}