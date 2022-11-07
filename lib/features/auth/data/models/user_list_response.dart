// To parse this JSON data, do
//
//     final userListResponse = userListResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

List<UserListResponse> userListResponseFromJson(String str) =>
    List<UserListResponse>.from(
        json.decode(str).map((x) => UserListResponse.fromJson(x)));

String userListResponseToJson(List<UserListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListResponse {
  UserListResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  AddressResponse? address;
  String? phone;
  String? website;
  CompanyResponse? company;

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      UserListResponse(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        address:
            json["address"] == null ? null : AddressResponse.fromJson(json["address"]),
        phone: json["phone"] == null ? null : json["phone"],
        website: json["website"] == null ? null : json["website"],
        company:
            json["company"] == null ? null : CompanyResponse.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "address": address == null ? null : address?.toJson(),
        "phone": phone == null ? null : phone,
        "website": website == null ? null : website,
        "company": company == null ? null : company?.toJson(),
      };
}

class AddressResponse {
  AddressResponse({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoResponse? geo;

  factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
        street: json["street"] == null ? null : json["street"],
        suite: json["suite"] == null ? null : json["suite"],
        city: json["city"] == null ? null : json["city"],
        zipcode: json["zipcode"] == null ? null : json["zipcode"],
        geo: json["geo"] == null ? null : GeoResponse.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street == null ? null : street,
        "suite": suite == null ? null : suite,
        "city": city == null ? null : city,
        "zipcode": zipcode == null ? null : zipcode,
        "geo": geo == null ? null : geo?.toJson(),
      };
}

class GeoResponse {
  GeoResponse({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory GeoResponse.fromJson(Map<String, dynamic> json) => GeoResponse(
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class CompanyResponse {
  CompanyResponse({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory CompanyResponse.fromJson(Map<String, dynamic> json) => CompanyResponse(
        name: json["name"] == null ? null : json["name"],
        catchPhrase: json["catchPhrase"] == null ? null : json["catchPhrase"],
        bs: json["bs"] == null ? null : json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "catchPhrase": catchPhrase == null ? null : catchPhrase,
        "bs": bs == null ? null : bs,
      };
}
