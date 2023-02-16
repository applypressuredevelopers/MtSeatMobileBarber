class ServiceModel {
  String? uid;
  String? serviceName;
  String? category;
  String? subCategory;
  String? totalDuration;
  String? restTime;
  String? restCutOff;
  String? price;
  String? serviceId;
  String? shop;
  String? shopName;


  ServiceModel({this.uid, this.serviceName, this.category, this.subCategory,
    this.totalDuration, this.restTime, this.restCutOff, this.price, this.serviceId, this.shop, this.shopName});

  factory ServiceModel.fromMap(map)
  {
    return ServiceModel(
      uid: map['uid'],
      serviceName: map['serviceName'],
      category: map['category'],
      subCategory: map['subCategory'],
      totalDuration: map['totalDuration'],
      restTime: map['restTime'],
      restCutOff: map['restCutOff'],
      price: map['price'],
      serviceId: map['serviceId'],
      shop: map['shop'],
      shopName: map['shopName'],

    );
  }
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'serviceName': serviceName,
      'category': category,
      'subCategory': subCategory,
      'totalDuration': totalDuration,
      'restTime': restTime,
      'restCutOff': restCutOff,
      'price': price,
      'serviceId': serviceId,
      'shop': shop,
      'shopName': shopName,

    };
  }

  ServiceModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],

        serviceName = snapshot.data()['serviceName'],
        category = snapshot.data()['category'],
        subCategory = snapshot.data()['subCategory'],
        totalDuration = snapshot.data()['totalDuration'],
        restTime = snapshot.data()['restTime'],
        restCutOff = snapshot.data()['restCutOff'],
        price = snapshot.data()['price'],
        shop = snapshot.data()['shop'],
        shopName = snapshot.data()['shopName'],

      serviceId = snapshot.data()['serviceId'];

}