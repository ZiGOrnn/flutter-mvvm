class UserModel {
  UserModel({
    this.id = 0,
    this.name = "",
    this.username = "",
    this.email = "",
    this.address = const AddressModel(),
    this.phone = "",
    this.website = "",
    this.company = const CompanyModel(),
  });

  int id;
  String name;
  String username;
  String email;
  AddressModel address;
  String phone;
  String website;
  CompanyModel company;
}

class AddressModel {
  const AddressModel({
    this.street = "",
    this.suite = "",
    this.city = "",
    this.zipcode = "",
    this.geo = const GeoModel(),
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;
}

class GeoModel {
  const GeoModel({
    this.lat = "",
    this.lng = "",
  });

  final String lat;
  final String lng;
}

class CompanyModel {
  const CompanyModel({
    this.name = "",
    this.catchPhrase = "",
    this.bs = "",
  });

  final String name;
  final String catchPhrase;
  final String bs;
}
