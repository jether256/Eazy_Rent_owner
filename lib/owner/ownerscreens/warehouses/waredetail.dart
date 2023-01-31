
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../preferences/pref.dart';
import '../../ownerpreferences/bizpref.dart';
import '../../widget/custom_drawer.dart';
import '../accout/editpersornal.dart';
import '../logged-signup/login.dart';

class WareDetail extends StatefulWidget {

  final String Id;
  final String uid;
  final String own;
  final String fon;
  final String biz;
  final String num;
  final String mail;
  final String im1;
  final String im2;
  final String im3;
  final String im4;
  final String im5;
  final String tit;
  final String pr;
  final String desc;
  final String adu;
  final String lat;
  final String lon;
  final String place;
  final String bed;
  final String bath;
  final String fun;
  final String con;
  final String b;
  final String c;
  final String flo;
  final String kit;
  final String paid;
  final String start;
  final String end;
  final String blo;
  final String type;
  final String proi;


  const WareDetail({ required this.Id, required this.uid, required this.own, required this.fon, required this.biz, required this.num, required this.mail, required this.im1, required this.im2, required this.im3, required this.im4, required this.im5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.place, required this.bed, required this.bath, required this.fun, required this.con, required this.b, required this.c, required this.flo, required this.kit, required this.paid, required this.start, required this.end, required this.blo, required this.type, required this.proi}) ;

  @override
  State<WareDetail> createState() => _WareDetailState();
}

class _WareDetailState extends State<WareDetail> {
  int _index=0;


  final _formated= NumberFormat();
  bool _loading=true;

  @override
  void initState() {
    getPref();
    getBusiness();

    Timer(const Duration(seconds: 2),(){

      setState(() {
        _loading=false;
      });

    });


    super.initState();
  }


  late List photos=[
    'https://eazyrent256.com/api/owner/mage1/${widget.im1}',
    'https://eazyrent256.com/api/owner/mage2/${widget.im2}',
    'https://eazyrent256.com/api/owner/mage3/${widget.im3}',
    'https://eazyrent256.com/api/owner/mage4/${widget.im4}',
    'https://eazyrent256.com/api/owner/mage5/${widget.im5}'
  ];



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

    //Navigator.pushReplacementNamed(context,OwnerSignUpScreen.id);
  }

  signOut2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(BusinessInfo.ID);
    sharedPreferences.remove(BusinessInfo.user_id);
    sharedPreferences.remove(BusinessInfo.logo);
    sharedPreferences.remove(BusinessInfo.shop);
    sharedPreferences.remove(BusinessInfo.bizname);
    sharedPreferences.remove(BusinessInfo.email1);
    sharedPreferences.remove(BusinessInfo.num1);
    sharedPreferences.remove(BusinessInfo.tax);
    sharedPreferences.remove(BusinessInfo.tin);
    sharedPreferences.remove(BusinessInfo.add);
    sharedPreferences.remove(BusinessInfo.lat);
    sharedPreferences.remove(BusinessInfo.lon);
    sharedPreferences.remove(BusinessInfo.time);
    sharedPreferences.remove(BusinessInfo.sta);
    sharedPreferences.remove(BusinessInfo.serve);
    sharedPreferences.remove(BusinessInfo.op);
    sharedPreferences.remove(BusinessInfo.rat);
    sharedPreferences.remove(BusinessInfo.tRat);
    sharedPreferences.remove(BusinessInfo.picked);
    sharedPreferences.remove(BusinessInfo.creat);
    sharedPreferences.remove(BusinessInfo.paidd);
    sharedPreferences.remove(BusinessInfo.online);
    sharedPreferences.remove(BusinessInfo.cood);
    sharedPreferences.remove(BusinessInfo.endd);
    sharedPreferences.remove(BusinessInfo.renu);
    sharedPreferences.remove(BusinessInfo.blok);


    logOut();

  }

  logOut(){
    Navigator.pushReplacementNamed(context,OwnerLoginScreen.id);
  }



  @override
  Widget build(BuildContext context) {
    
    var _price=int.parse(widget.pr);
    String price=_formated.format(_price);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tit,maxLines:2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        elevation: 0,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: (){

                signOut().then((value){

                  signOut2();
                });

              },
              child: const Icon(Icons.person,color: Colors.white,),
            ),
          ),
        ],

      ),
      drawer:const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // borderRadius: BorderRadius.circular(2),
              ),
              child: _loading ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height:10,),

                    const Text('Loading Houses..'),

                  ],
                ),
              ):ListView(
                scrollDirection: Axis.horizontal,
                children:photos.map((e){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CachedNetworkImage(imageUrl:photos[_index]),
                  );
                }).toList(),
              ),
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.tit.toUpperCase(),maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,),),
                  const SizedBox(height: 10,),
                  Text(widget.place.toUpperCase(),maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,),),
                  const SizedBox(height: 30,),
                  Text('\Shs $price',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

                  //desc
                  const SizedBox(height: 10,),

                  const Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  const SizedBox(height: 10,),
                  const Divider(color: Colors.grey,thickness: 3,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Text(widget.desc),

                                ExpandableText(
                                  widget.desc,
                                  expandText: 'View More',
                                  collapseText: 'View Less',
                                  maxLines: 2,
                                  style: const TextStyle(color:Colors.black),
                                ),
                                const SizedBox(height: 10,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BedRooms: ${widget.bed}'),
                                    const SizedBox(height: 4,),
                                    Text('BathRooms: ${widget.bath}'),
                                    const SizedBox(height: 4,),
                                    Text('Furnishing: ${widget.fun}'),
                                    const SizedBox(height: 4,),
                                    Text('Construction status: ${widget.con}'),
                                    const SizedBox(height: 4,),
                                    Text('Total Floors: ${widget.flo}'),
                                    const SizedBox(height: 4,),
                                    Text('Kitchen: ${widget.kit}'),
                                    const SizedBox(height: 4,),
                                    Text('Building Sqft: ${widget.b}'),
                                    const SizedBox(height: 4,),
                                    Text('Floor Sqft: ${widget.c}'),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Text('Posted at: ${widget.start}'),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(color: Colors.grey,),

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.shade300,
                          radius: 38,
                          child: Icon(CupertinoIcons.person_alt,
                            size: 60,
                            color: Colors.red.shade300,),
                        ),

                      ),
                      const SizedBox(height: 10,),

                      Expanded(
                        child: ListTile(
                          title: Text(widget.own,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: const Text('See Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          trailing: IconButton(icon:const Icon(Icons.arrow_forward_ios,size: 12,), onPressed: () {


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  EditPersonalAccount(

                                    )));


                          },),
                        ),
                      )
                    ],

                  ),

                  const SizedBox(height: 8,),
                  const Text('Location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  const SizedBox(height: 10,),


                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: Text('HOUSE ID:  ${widget.proi}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),

                      TextButton(
                        onPressed: () {

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>  Report(id:widget.id,userID:widget.userID,own:widget.own,
                          //           fon:widget.fon,biz:widget.biz,bizphon:widget.bizphon,mail:widget.mail,
                          //           im1:widget.im1,im2:widget.im2,im3:widget.im3,im4:widget.im4,im5:widget.im5,
                          //           tit:widget.tit,pr:widget.pr,desc:widget.desc,adu:widget.adu,lat:widget.lat,lon:widget.lon,
                          //           place:widget.place,bed:widget.bed,bath:widget.bath,fun:widget.fun,con:widget.con,sq:widget.sq,cs:widget.cs,
                          //           flo:widget.flo,kit:widget.kit,paid:widget.paid,start:widget.start,end:widget.end,blocked:widget.blocked,
                          //           type:widget.type,proid:widget.proid,
                          //         )));


                        },
                        child: const Text('REPORT ',style: TextStyle(color: Colors.blue),
                        ),),
                    ],
                  ),
                ],

              ),
            )

          ],
        ),
      ),
    );
  }
}
