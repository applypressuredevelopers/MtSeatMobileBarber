class AccountModel {
  String? uid;
  String? fullName;
  String? email;
  String? password;
  String? contactNumber;
  String? location;
  String? gender;
  String? shop;
  String? image;
  String? barberStatus;

  AccountModel(
      {this.uid,
      this.fullName,
      this.email,
      this.password,
      this.contactNumber,
      this.location,
      this.gender,
      this.shop,
      this.image,
      this.barberStatus});

  factory AccountModel.fromMap(map) {
    return AccountModel(
        uid: map['uid'],
        fullName: map['fullName'],
        email: map['email'],
        location: map['location'],
        contactNumber: map['contactNumber'],
        gender: map['gender'],
        shop: map['shop'],
        image: map['image'],
        barberStatus: map['barberStatus']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'location': location,
      'contactNumber': contactNumber,
      'gender': gender,
      'shop': shop,
      'image': image,
      'barberStatus': barberStatus
    };
  }

  AccountModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],
        fullName = snapshot.data()['fullName'],
        email = snapshot.data()['email'],
        location = snapshot.data()['location'],
        contactNumber = snapshot.data()['contactNumber'],
        gender = snapshot.data()['gender'],
        shop = snapshot.data()['shop'],
        image = snapshot.data()['image'],
        barberStatus = snapshot.data()['barberStatus'];
}
