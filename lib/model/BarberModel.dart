class BarberModel {
  String? uid;
  String? fullName;
  String? email;
  String? password;
  String? contactNumber;
  String? location;
  String? gender;
  String? image;
  String? shopOwner;
  String? barberStatus;

  BarberModel(
      {this.uid,
      this.fullName,
      this.email,
      this.password,
      this.contactNumber,
      this.location,
      this.gender,
      this.shopOwner,
      this.image,
      this.barberStatus});

  factory BarberModel.fromMap(map) {
    return BarberModel(
        uid: map['uid'],
        fullName: map['fullName'],
        email: map['email'],
        location: map['location'],
        contactNumber: map['contactNumber'],
        gender: map['gender'],
        shopOwner: map['shopOwner'],
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
      'shopOwner': shopOwner,
      'image': image,
      'barberStatus': barberStatus
    };
  }

  BarberModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],
        fullName = snapshot.data()['fullName'],
        email = snapshot.data()['email'],
        location = snapshot.data()['location'],
        contactNumber = snapshot.data()['contactNumber'],
        gender = snapshot.data()['gender'],
        image = snapshot.data()['image'],
        shopOwner = snapshot.data()['shopOwner'],
        barberStatus = snapshot.data()['barberStatus'];
}
