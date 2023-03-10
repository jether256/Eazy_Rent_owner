import 'dart:convert';

// CategoryModel welcomeFromJson(String str) => CategoryModel.fromJson(json.decode(str));
// String welcomeToJson(CategoryModel data) => json.encode(data.toJson());
List<BusinessModel> businessFromJson(String str) =>
    List<BusinessModel>.from(json.decode(str).map((x) => BusinessModel.fromJson(x)));

String businessToJson(List<BusinessModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessModel {

  final int id;
  final  String user_id;
  final String  logo;
  final String  shopImage;
  final  String  bizname;
  final String  phone1;
  final String  email1;
  final String  tax;
  final String  tin;
  final  String  ad;
  final String  lon;
  final String  lat;
  final  String  time;
  final String  status;
  final String  service;
  final String  open;
  final String  ratin;
  final String  totora;
  final String  picked;
  final String  create;
  final String  paid;
  final String  onli;
  final String  cod;
  final String  end;
  final String  renew;
  final String  blocked;

  BusinessModel( { required this.id, required this.user_id, required this.logo, required this.shopImage, required this.bizname, required this.phone1, required this.email1, required this.tax, required this.tin, required this.ad, required this.lon,
    required this.lat, required this.time, required this.status, required this.service, required this.open, required this.ratin, required this.totora, required this.picked, required this.create, required this.paid,
    required this.onli, required this.cod, required this.end, required this.renew, required this.blocked,});


  factory  BusinessModel.fromJson(json){
    return    BusinessModel(
      id:json['ID'],
      user_id:json['user_id'],
      logo:json['logo'],
      shopImage:json['shopImage'],
      bizname:json['bizname'],
      phone1 :json['phone1'],
      email1:json['email1'],
      tax:json['taxRegistered'],
      tin:json['tinNumber'],
      ad:json['address'],
      lon:json['lon'],
      lat:json['lat'],
      time:json['time1'],
      status:json['status1'],
      service: json['service'],
      open: json['shopOpen'],
      ratin: json['rating'],
      totora: json['totalRating'],
      picked: json['isTopPicked'],
      create: json['create_t'],
      paid: json['paid'],
      onli: json['online'],
      cod: json['cod'],
      end: json['end'],
      renew: json['renew'],
      blocked: json['blocked'],
    );
  }


  Map<String, dynamic> toJson() => {
    "ID": id,
    "user_id":user_id ,
    "logo":logo ,
    "shopImage": shopImage,
    "bizname": bizname,
    "phone1":phone1 ,
    "email1":email1 ,
    "taxRegistered":tax ,
    "tinNumber": tin,
    "address": ad,
    "lon": lon,
    "lat": lat,
    "time1": time,
    "status1": status,
    "service":service ,
    "shopOpen":open ,
    "rating":ratin ,
    "totalRating":totora ,
    "isTopPicked":picked ,
    "create_t":create ,
    "paid":paid ,
    "online":onli ,
    "cod": cod,
    "end":end ,
    "renew":renew ,
    "blocked":blocked ,
    };

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "user_id":user_id ,
      "logo":logo ,
      "shopImage": shopImage,
      "bizname": bizname,
      "phone1":phone1 ,
      "email1":email1 ,
      "taxRegistered":tax ,
      "tinNumber": tin,
      "address": ad,
      "lon": lon,
      "lat": lat,
      "time1": time,
      "status1": status,
      "service":service ,
      "shopOpen":open ,
      "rating":ratin ,
      "totalRating":totora ,
      "isTopPicked":picked ,
      "create_t":create ,
      "paid":paid ,
      "online":onli ,
      "cod": cod,
      "end":end ,
      "renew":renew ,
      "blocked":blocked ,
    };
  }



  factory  BusinessModel.fromMap(Map<String, dynamic> json) {
    return    BusinessModel(
      id:json['ID'],
      user_id:json['user_id'],
      logo:json['logo'],
      shopImage:json['shopImage'],
      bizname:json['bizname'],
      phone1 :json['phone1'],
      email1:json['	email1'],
      tax:json['taxRegistered'],
      tin:json['tinNumber'],
      ad:json['address'],
      lon:json['lon'],
      lat:json['lat'],
      time:json['time1'],
      status:json['status1'],
      service: json['service'],
      open: json['shopOpen'],
      ratin: json['rating'],
      totora: json['totalRating'],
      picked: json['isTopPicked'],
      create: json['create_t'],
      paid: json['paid'],
      onli: json['online'],
      cod: json['cod'],
      end: json['end'],
      renew: json['renew'],
      blocked: json['blocked'],
    );
  }

}
