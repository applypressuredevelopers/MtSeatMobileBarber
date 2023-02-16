import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  String? uid;
  String? fullName;
  String? email;
  String? password;
  String? contactNumber;
  String? location;
  String? gender;
  String? shopOwner;
  String? shopName;
  String? shopType;
  String? city;
  String? country;
  String? postCode;


  ShopModel({this.uid, this.fullName, this.email, this.password,
    this.contactNumber, this.location, this.gender, this.shopOwner
    , this.shopName, this.shopType, this.city, this.postCode, this.country});

  factory ShopModel.fromMap(map)
  {
    return ShopModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      location: map['location'],
      contactNumber: map['contactNumber'],
      gender: map['gender'],
      shopOwner: map['shopOwner'],
      shopName: map['shopName'],
      shopType: map['shopType'],
      city: map['city'],
      postCode: map['postCode'],
      country: map['country'],
    );
  }
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'location': location,
      'contactNumber': contactNumber,
      'gender': gender,
      'shopOwner': shopOwner,
      'shopName': shopName,
      'shopType': shopType,
      'city': city,
      'postCode': postCode,
      'country': country,
    };
  }

  ShopModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],

        fullName = snapshot.data()['fullName'],
        email = snapshot.data()['email'],
        location = snapshot.data()['location'],
        contactNumber = snapshot.data()['contactNumber'],
        gender = snapshot.data()['gender'],
        shopOwner = snapshot.data()['shopOwner'],
        shopName = snapshot.data()['shopName'],
        shopType = snapshot.data()['shopType'],
        city = snapshot.data()['city'],
        postCode = snapshot.data()['postCode'],
      country = snapshot.data()['country'];






}