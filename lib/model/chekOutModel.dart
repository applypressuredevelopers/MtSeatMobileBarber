
class CheckoutModel{
  String? id;
  String? uid;
  String? userName;
  String? email;
  String? style;
  String? stylistId;
  String? styleId;
  String? slot;
  int? day;
  String? month;
  int? mon;
  String? year;
  String? shop;
  String? contactNumber;
  String? price;
  String? note;
  String? queue;
  String? shopName;
  String? time;
  String? slotTo;




  CheckoutModel({
    this.id,
    this.uid,
    this.userName,
    this.email,
    this.style,
    this.stylistId,
    this.styleId,
    this.slot,
    this.day,
    this.month,
    this.year,
    this.shop,
    this.contactNumber,
    this.mon,
    this.price,
    this.note,
    this.queue,
    this.shopName,
    this.time,
    this.slotTo,


  });

  factory CheckoutModel.fromMap(map)
  {
    return CheckoutModel(
      id: map['id'],
      uid: map['uid'],
      userName: map['userName'],
      email: map['email'],
      style: map['style'],
      stylistId: map['stylistId'],
      styleId: map['styleId'],
      slot: map['slot'],
      day: map['day'],
      month: map['month'],
      year: map['year'],
      shop: map['shop'],
      contactNumber: map['contactNumber'],
      mon: map['mon'],
      price: map['price'],
      note: map['note'],
      shopName: map['shopName'],
      queue: map['queue'],
      time: map['time'],
      slotTo: map['slotTo'],




    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'uid': uid,
      'userName': userName,
      'email': email,
      'style': style,
      'stylistId': stylistId,
      'styleId': styleId,
      'slot': slot,
      'day': day,
      'month': month,
      'year': year,
      'shop': shop,
      'contactNumber': contactNumber,
      'mon': mon,
      'price': price,
      'note': note,
      'shopName': shopName,
      'queue': queue,
      'time': time,
      'slotTo': slotTo,




    };
  }

  CheckoutModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],
        id = snapshot.data()['id'],
        userName = snapshot.data()['userName'],
        email = snapshot.data()['email'],
        style = snapshot.data()['style'],
        stylistId = snapshot.data()['stylistId'],
        styleId = snapshot.data()['styleId'],
        slot = snapshot.data()['slot'],
        day = snapshot.data()['day'],
        month = snapshot.data()['month'],
        year = snapshot.data()['year'],
        shop = snapshot.data()['shop'],
        mon = snapshot.data()['mon'],
        price = snapshot.data()['price'],
        note = snapshot.data()['note'],
        shopName = snapshot.data()['shopName'],
        queue = snapshot.data()['queue'],
        time = snapshot.data()['time'],
        slotTo = snapshot.data()['slotTo'],

      contactNumber = snapshot.data()['contactNumber'];
}









