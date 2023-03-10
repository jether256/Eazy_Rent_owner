import 'dart:convert';

List<OwnerModel> businessFromJson(String str) =>
    List<OwnerModel>.from(json.decode(str).map((x) => OwnerModel.fromJson(x)));

String businessToJson(List<OwnerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class OwnerModel {

  final String ID;
  final  String name;
  final String  email;
  final String  num;
  final  String  pass;
  final String  pic;
  final String  lo;
  final String  lat;
  final String  ad;
  final  String  token;
  final String  renew;
  final String  status;
  final  String  type;
  final String  log;
  final String  create;
  final String  fcm;

  OwnerModel({required this.ID,required this.name,required this.email,required this.num,required this.pass,required this.pic,required this.lo,required this.lat,required this.ad,required this.token,required this.renew,required this.status,required this.type,required this.log,required this.create,required this.fcm, });


  factory OwnerModel.fromJson(json){
    return   OwnerModel(
      ID:json['id'].toString(),
      name:json['name'],
      email:json['email'],
      num:json['phone'],
      pass:json['password'],
      pic :json['pic'],
      lo:json['lon'],
      lat:json['lat'],
      ad:json['addr'],
      token:json['token'],
      status:json['status'],
      type:json['type'],
      create:json['create_date'],
      log:json['last_log'],
      renew: json['renew_date'],
      fcm: json['fcmid'],
    );
  }


  Map<String, dynamic> toJson() => {
    "id": ID,
    "name":name,
    "email":email,
    "phone":num,
    "password":pass,
    "pic":pic,
    "lon":lo,
    "lat":lat,
    "addr":ad,
    "token":token,
    "renew_date":renew,
    "status":status,
    "type":type,
    "create_date":create,
    "last_log":log,
    "fcmid":fcm,
  };

  Map<String, dynamic> toMap() {
    return {
      "id": ID,
      "name":name,
      "email":email,
      "phone":num,
      "password":pass,
      "pic":pic,
      "lon":lo,
      "lat":lat,
      "addr":ad,
      "token":token,
      "renew_date":renew,
      "status":status,
      "type":type,
      "create_date":create,
      "last_log":log,
      "fcmid":fcm,
    };
  }



  factory OwnerModel.fromMap(Map<String, dynamic> json) {
    return   OwnerModel(
      ID:json['id'],
      name:json['name'],
      email:json['email'],
      num:json['phone'],
      pass:json['password'],
      pic :json['pic'],
      lo:json['lon'],
      lat:json['lat'],
      ad:json['addr'],
      token:json['token'],
      renew:json['renew_date'],
      status:json['status'],
      type:json['type'],
      create:json['create_date'],
      log:json['last_log'],
      fcm: json['fcmid'],
    );
  }

}
