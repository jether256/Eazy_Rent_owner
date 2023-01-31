import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/register.dart';
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/sign.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../preferences/pref.dart';
import '../../ownermodels/business.dart';
import '../../ownerpreferences/bizpref.dart';
import '../dashboardowner.dart';

class WaitVerification extends StatefulWidget {

  static const  String id='linda veri';

  @override
  State<WaitVerification> createState() => _WaitVerificationState();
}

class _WaitVerificationState extends State<WaitVerification> with SingleTickerProviderStateMixin{


  late Animation _animation;
  late AnimationController _animationController;

  var listRadius=[150.0,200.0,250.0,300.0,350.0];







  @override
  void initState() {

    getPref();
    //Funa();

    showBiz();

    _animationController=AnimationController(vsync: this,duration:const Duration(seconds: 5),lowerBound: 0.5 );
    //_animation=Tween(begin: 0.0,end:1.0 ).animate(_animationController);
    _animationController.addListener(() {

    });

    _animationController.forward();

    getBusiness();

    super.initState();
  }


  //get business array
  Funa() async {

    var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/owner/singleBiz.php'),
        headers: {"Accept": "headers/json"},body:{'user_id':'$userID'});



    if(response.statusCode==200){

      var jsonData=json.decode(response.body);

      String ID=jsonData['ID'];
      String user_id=jsonData['user_id'];
      String logo=jsonData['logo'];
      String shop=jsonData['shopImage'];
      String bizname=jsonData['bizname'];
      String email1=jsonData['email1'];
      String num1=jsonData['phone1'];
      String tax=jsonData['taxRegistered'];
      String tin =jsonData['tinNumber'];
      String add=jsonData['address'];
      String  time=jsonData['time1'];
      String  sta=jsonData['status1'];
      String serve=jsonData['service'];
      String op=jsonData['shopOpen'];
      String rat=jsonData['rating'];
      String tRat=jsonData['totalRating'];
      String picked=jsonData['isTopPicked'];
      String create=jsonData['create_t'];
      String paidd=jsonData['paid'];
      String online=jsonData['online'];
      String cood=jsonData['cod'];
      String endd=jsonData['end'];
      String renu=jsonData['renew'];
      String blok=jsonData['blocked'];


      if(jsonData=="ERROR"){


        Navigator.pushReplacementNamed(context,RegisterOwner.id);

      }else{

        saveBusiness(ID, user_id, logo, shop, bizname, email1, num1, tax, tin, add, time, sta, serve, op, rat,
            tRat,picked,create,paidd,online,cood,endd,renu,blok
        );


        if(jsonData['status']=='verified'){
          veri();
        }


        print(jsonData);
      }

    }else{

      Navigator.pushReplacementNamed(context,RegisterOwner.id);
    }



  }

  veri(){

    Navigator.pushReplacementNamed(context,DashBoardOwner.id);
  }


//get business array
  List<BusinessModel> biz = [];
  Future showBiz() async {
    var response = await http.post(
        Uri.parse("https://www.eazyrent256.com/api/owner/getBiz2.php"),
        headers: {"Accept": "headers/json"},body:{'user_id':'$userID'});
    if (response.statusCode == 200) {

      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          biz.add(BusinessModel.fromJson(item));
        }
      });
      //print(jsonData);

    }
  }


  //get business array
 //  List<BusinessModel> biz = [];
 // Future<bool> Funa() async {
 //
 //    await openBox();
 //
 //    var response=await http.post(Uri.parse('https://mymusawoee.000webhostapp.com/api/owner/singleBiz.php'),
 //        body:{'user_id':'$userID'});
 //
 //
 //
 //    if(response.statusCode==200){
 //      var jsonData=json.decode(response.body);
 //      await putData(jsonData);
 //      //
 //      // String ID=jsonData['ID'];
 //      // String user_id=jsonData['user_id'];
 //      // String logo=jsonData['logo'];
 //      // String shop=jsonData['shopImage'];
 //      // String bizname=jsonData['bizname'];
 //      // String email=jsonData['email1'];
 //      // String num=jsonData['phone1'];
 //      // String tax=jsonData['taxRegistered'];
 //      // String tin =jsonData['tinNumber'];
 //      // String add=jsonData['address'];
 //      // String  time=jsonData['time1'];
 //      // String  sta=jsonData['status1'];
 //      // String serve=jsonData['service'];
 //      // String op=jsonData['shopOpen'];
 //      // String rat=jsonData['rating'];
 //      // String tRat=jsonData['totalRating'];
 //      // String picked=jsonData['isTopPicked'];
 //      // String create=jsonData['create_t'];
 //      // String paidd=jsonData['paid'];
 //      // String online=jsonData['online'];
 //      // String cood=jsonData['cod'];
 //      // String endd=jsonData['end'];
 //      // String renu=jsonData['renew'];
 //      // String blok=jsonData['blocked'];
 //      //
 //      // saveBusiness(ID,user_id,logo,shop,bizname,email,num,tax,tin,add,time,sta,serve,op,rat,tRat,picked,create,paidd,online,cood,endd,renu,blok);
 //      //
 //      if(jsonData['status1']=='verified'){
 //        Navigator.pushReplacementNamed(context,DashBoardOwner.id);
 //      }
 //
 //      setState(() {
 //        final data = jsonDecode(response.body);
 //
 //        getData();
 //        for (Map item in data) {
 //          biz.add(BusinessModel.fromJson(item));
 //        }
 //
 //
 //
 //      });
 //
 //        print(jsonData);
 //
 //
 //    }else{
 //
 //      Navigator.pushReplacementNamed(context,RegisterOwner.id);
 //    }
 //
 //
 //
 //    var mymap=box.toMap().values.toList();
 //    if(mymap.isEmpty){
 //
 //      data.add('empty');
 //    }else{
 //
 //      data=mymap;
 //    }
 //
 //    return Future.value(true);
 //
 //  }




  // getData() async {
  //
  //   var response=await http.post(Uri.parse('https://mymusawoee.000webhostapp.com/api/owner/getBiz2.php'),
  //
  //       body:{"user_id":'$userID'});
  //
  //
  //
  //   if(response.statusCode==200){
  //
  //     var jsonData=json.decode(response.body);
  //
  //     String ID=jsonData['ID'];
  //     String user_id=jsonData['user_id'];
  //     String logo=jsonData['logo'];
  //     String shop=jsonData['shopImage'];
  //     String bizname=jsonData['bizname'];
  //     String email1=jsonData['email1'];
  //     String num1=jsonData['phone1'];
  //     String tax=jsonData['taxRegistered'];
  //     String tin =jsonData['tinNumber'];
  //     String add=jsonData['address'];
  //     String  time=jsonData['time1'];
  //     String  sta=jsonData['status1'];
  //     String serve=jsonData['service'];
  //     String op=jsonData['shopOpen'];
  //     String rat=jsonData['rating'];
  //     String tRat=jsonData['totalRating'];
  //     String picked=jsonData['isTopPicked'];
  //     String create=jsonData['create_t'];
  //     String paidd=jsonData['paid'];
  //     String online=jsonData['online'];
  //     String cood=jsonData['cod'];
  //     String endd=jsonData['end'];
  //     String renu=jsonData['renew'];
  //     String blok=jsonData['blocked'];
  //
  //
  //
  //     if(jsonData=="ERROR"){
  //
  //
  //
  //     }else{
  //
  //       saveBusiness(ID, user_id, logo, shop, bizname, email1, num1, tax, tin, add, time, sta, serve, op, rat,
  //           tRat,picked,create,paidd,online,cood,endd,renu,blok
  //       );
  //
  //
  //
  //       print(jsonData);
  //     }
  //
  //   }
  //
  //
  // }





  String? userID,name,email,num, pass, pic,lon, lat,ad, token,renew,status,type,log,create,cry,uup,fcmi;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userID = sharedPreferences.getString(PrefInfo.ID);
      name = sharedPreferences.getString(PrefInfo.name);
      email = sharedPreferences.getString(PrefInfo.email);
      num = sharedPreferences.getString(PrefInfo.num);
      pass = sharedPreferences.getString(PrefInfo.pass);
      pic = sharedPreferences.getString(PrefInfo.pic);
      lon = sharedPreferences.getString(PrefInfo.lon);
      lat = sharedPreferences.getString(PrefInfo.lat);
      ad = sharedPreferences.getString(PrefInfo.ad);
      token = sharedPreferences.getString(PrefInfo.token);
      renew = sharedPreferences.getString(PrefInfo.renew);
      status = sharedPreferences.getString(PrefInfo.status);
      type = sharedPreferences.getString(PrefInfo.type);
      log = sharedPreferences.getString(PrefInfo.log);
      create = sharedPreferences.getString(PrefInfo.create);
      fcmi = sharedPreferences.getString(PrefInfo.fcm);
    });
  }




  saveBusiness(String ID,String  user_id,String logo,String shop,String bizname,String email1,String num1,String tax,String tin,
      String add,String time,String sta,String serve,String op,String rat,String tRat,String picked,String create,
      String paidd,String online,String cood,String endd,String renu,String blok) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    setState(() {
      sharedPreferences.setString(BusinessInfo.ID, ID);
      sharedPreferences.setString(BusinessInfo.user_id, user_id);
      sharedPreferences.setString(BusinessInfo.logo, logo);
      sharedPreferences.setString(BusinessInfo.shop, shop);
      sharedPreferences.setString(BusinessInfo.bizname,bizname);
      sharedPreferences.setString(BusinessInfo.email1,email1);
      sharedPreferences.setString(BusinessInfo.num1, num1);
      sharedPreferences.setString(BusinessInfo.tax, tax);
      sharedPreferences.setString(BusinessInfo.tin, tin);
      sharedPreferences.setString(BusinessInfo.add,add);
      sharedPreferences.setString(BusinessInfo.time, time);
      sharedPreferences.setString(BusinessInfo.sta,sta);
      sharedPreferences.setString(BusinessInfo.serve,serve);
      sharedPreferences.setString(BusinessInfo.op, op);
      sharedPreferences.setString(BusinessInfo.rat, rat);
      sharedPreferences.setString(BusinessInfo.tRat, tRat);
      sharedPreferences.setString(BusinessInfo.picked, picked);
      sharedPreferences.setString(BusinessInfo.creat, create);
    });

  }

  String? ID,user_id,logo,shop,bizname,email1,num1,tax,tin,add,time, sta, serve,op,rat,tRat,picked,crete,paid,on,cod,end,renu,blok;

  getBusiness() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    ID = sharedPreferences.getString(BusinessInfo.ID);
    user_id = sharedPreferences.getString(BusinessInfo.user_id);
    logo= sharedPreferences.getString(BusinessInfo.logo);
    shop= sharedPreferences.getString(BusinessInfo.shop);
    bizname= sharedPreferences.getString(BusinessInfo.bizname);
    email1= sharedPreferences.getString(BusinessInfo.email1);
    num1= sharedPreferences.getString(BusinessInfo.num1);
    tax= sharedPreferences.getString(BusinessInfo.tax);
    tin= sharedPreferences.getString(BusinessInfo.tin);
    add = sharedPreferences.getString(BusinessInfo.add);
    time = sharedPreferences.getString(BusinessInfo.time);
    sta= sharedPreferences.getString(BusinessInfo.sta);
    serve= sharedPreferences.getString(BusinessInfo.serve);
    op= sharedPreferences.getString(BusinessInfo.op);
    rat= sharedPreferences.getString(BusinessInfo.rat);
    tRat= sharedPreferences.getString(BusinessInfo.tRat);
    picked= sharedPreferences.getString(BusinessInfo.picked);
    crete= sharedPreferences.getString(BusinessInfo.creat);
    paid= sharedPreferences.getString(BusinessInfo.paidd);
    on= sharedPreferences.getString(BusinessInfo.online);
    cod= sharedPreferences.getString(BusinessInfo.cood);
    end= sharedPreferences.getString(BusinessInfo.endd);
    renu= sharedPreferences.getString(BusinessInfo.renu);
    blok= sharedPreferences.getString(BusinessInfo.blok);
  }




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future:showBiz(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){

          if (snapshot.hasData) {

            Funa();

            return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: biz.length,
                itemBuilder: (context, index) {
                  return Kalabe(
                    ID: biz[index].id.toString(),
                    logo: 'https://www.eazyrent256.com/api/owner/logo/${biz[index].logo}',
                    shop: 'https://www.eazyrent256.com/api/owner/shop/${biz[index].shopImage}',
                    biz: biz[index].bizname,
                    phon: biz[index].phone1,
                    mail: biz[index].email1,
                    tax:biz[index].tax,
                    tin: biz[index].tin,
                    ad: biz[index].ad,
                    time:biz[index].time,
                    stat: biz[index].status,
                    serve: biz[index].service,
                  );
                });

          } else {

            return Container(
              color: Colors.lightBlue,
              height: 200,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  // children:listRadius.map((radius) => Container(
                  //   width:radius * _animationController.value,
                  //   height:radius * _animationController.value,
                  //   decoration:  BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.blue.withOpacity(1.0 - _animationController.value)
                  //   ),
                  // )).toList(),
                  children:[
                    buildMyContainer(listRadius[0]),
                    buildMyContainer(listRadius[1]),
                    buildMyContainer(listRadius[2]),
                    buildMyContainer(listRadius[3]),
                    buildMyContainer(listRadius[4]),
                    const Text('Wait....',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            );

          }
        }



    );

  }

  Widget buildMyContainer (radius){

    return Container(
      width:radius * _animationController.value,
      height:radius * _animationController.value,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70.withOpacity(1.0 - _animationController.value)
      ),
    );
  }

}





class Kalabe extends StatefulWidget {



  final String ID;

  final String logo;
  final String shop;
  final String biz;
  final String phon;
  final String mail;
  final String tax;
  final String tin;
  final String ad;
  final String time;
  final String stat;
  final String serve;

  Kalabe({required this.logo, required this.shop, required this.biz, required this.phon, required this.mail, required this.tax, required this.tin, required this.ad, required this.time, required this.stat, required this.serve, required this.ID});

  @override
  _KalabeState createState() => _KalabeState();
}

class _KalabeState extends State<Kalabe> {

  String? ID,user_id,logo,shop,bizname,email1,num1,tax,tin,add,time, sta, serve,op,rat,tRat,picked,crete,paid,on,cod,end,renu,blok;
  getBusiness() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    ID = sharedPreferences.getString(BusinessInfo.ID);
    user_id = sharedPreferences.getString(BusinessInfo.user_id);
    logo= sharedPreferences.getString(BusinessInfo.logo);
    shop= sharedPreferences.getString(BusinessInfo.shop);
    bizname= sharedPreferences.getString(BusinessInfo.bizname);
    email1= sharedPreferences.getString(BusinessInfo.email1);
    num1= sharedPreferences.getString(BusinessInfo.num1);
    tax= sharedPreferences.getString(BusinessInfo.tax);
    tin= sharedPreferences.getString(BusinessInfo.tin);
    add = sharedPreferences.getString(BusinessInfo.add);
    time = sharedPreferences.getString(BusinessInfo.time);
    sta= sharedPreferences.getString(BusinessInfo.sta);
    serve= sharedPreferences.getString(BusinessInfo.serve);
    op= sharedPreferences.getString(BusinessInfo.op);
    rat= sharedPreferences.getString(BusinessInfo.rat);
    tRat= sharedPreferences.getString(BusinessInfo.tRat);
    picked= sharedPreferences.getString(BusinessInfo.picked);
    crete= sharedPreferences.getString(BusinessInfo.creat);
    paid= sharedPreferences.getString(BusinessInfo.paidd);
    on= sharedPreferences.getString(BusinessInfo.online);
    cod= sharedPreferences.getString(BusinessInfo.cood);
    end= sharedPreferences.getString(BusinessInfo.endd);
    renu= sharedPreferences.getString(BusinessInfo.renu);
    blok= sharedPreferences.getString(BusinessInfo.blok);
  }




  String? userID,name,email,num, pass, pic,lon, lat,ad, token,renew,status,type,log,create,cry,uup,fcmi;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userID = sharedPreferences.getString(PrefInfo.ID);
      name = sharedPreferences.getString(PrefInfo.name);
      email = sharedPreferences.getString(PrefInfo.email);
      num = sharedPreferences.getString(PrefInfo.num);
      pass = sharedPreferences.getString(PrefInfo.pass);
      pic = sharedPreferences.getString(PrefInfo.pic);
      lon = sharedPreferences.getString(PrefInfo.lon);
      lat = sharedPreferences.getString(PrefInfo.lat);
      ad = sharedPreferences.getString(PrefInfo.ad);
      token = sharedPreferences.getString(PrefInfo.token);
      renew = sharedPreferences.getString(PrefInfo.renew);
      status = sharedPreferences.getString(PrefInfo.status);
      type = sharedPreferences.getString(PrefInfo.type);
      log = sharedPreferences.getString(PrefInfo.log);
      create = sharedPreferences.getString(PrefInfo.create);
      fcmi = sharedPreferences.getString(PrefInfo.fcm);
    });
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefInfo.ID);
    sharedPreferences.remove(PrefInfo.name);
    sharedPreferences.remove(PrefInfo.email);
    sharedPreferences.remove(PrefInfo.num);
    sharedPreferences.remove(PrefInfo.pass);
    sharedPreferences.remove(PrefInfo.pic);
    sharedPreferences.remove(PrefInfo.lon);
    sharedPreferences.remove(PrefInfo.lat);
    sharedPreferences.remove(PrefInfo.ad);
    sharedPreferences.remove(PrefInfo.token);
    sharedPreferences.remove(PrefInfo.renew);
    sharedPreferences.remove(PrefInfo.status);
    sharedPreferences.remove(PrefInfo.type);
    sharedPreferences.remove(PrefInfo.log);
    sharedPreferences.remove(PrefInfo.create);

    Navigator.pushReplacementNamed(context,OwnerSignUpScreen.id);
  }

  @override
  void initState() {
    getPref();
    getBusiness();


    super.initState();
  }



  @override
  Widget build(BuildContext context) {




    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [

                Center(
                  child: SizedBox(
                    height:80 ,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl:widget.logo,
                        // imageUrl:'https://mymusawoee.000webhostapp.com/api/owner/logo/${biz[index]['logo']}',
                        placeholder: (context,url)=>Container(
                          height: 80,
                          width: 80,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),

                  ),
                ),

                const SizedBox(height: 10,),

                Text(widget.biz,style: const TextStyle(fontSize: 22),),

                const Text('Your  Registration sent to Eazy Rent Admin \n Admin will contact you soon..',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),),

              ],

            ),
          ],
        ),
      ),
    );
  }


}
