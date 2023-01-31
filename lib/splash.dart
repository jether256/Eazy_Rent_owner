import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazy_landlord/preferences/pref.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/colors.dart';
import 'owner/ownerpreferences/bizpref.dart';
import 'owner/ownerscreens/dashboardowner.dart';
import 'owner/ownerscreens/logged-signup/login.dart';
import 'owner/ownerscreens/logged-signup/register.dart';
import 'owner/ownerscreens/logged-signup/sign.dart';
import 'owner/ownerscreens/logged-signup/wait.dart';
import 'owner/ownerscreens/wait.dart';


class Splash extends StatefulWidget {
  static const  String id='splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


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

  @override
  void initState() {
    getPref();
    getBusiness();


    Timer( const Duration(seconds: 5,),(){


      getPref1();


    });

    super.initState();
  }



  String? ID1;
  String? Tru1;

  getPref1() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      ID1=sharedPreferences.getString(PrefInfo.ID);
      ID1== null ? sessionLogout():sessionLogin();
    });
  }


  sessionLogout() {
    Navigator.pushReplacementNamed(context,OwnerLoginScreen.id);
  }

  sessionLogin() {
    getBusi();
    //Navigator.pushReplacementNamed(context,DashBoardOwner.id);
  }

  getBusi() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      Tru1=sharedPreferences.getString(BusinessInfo.ID);
      Tru1== null ? sessionRegist():sessionDash();
    });

  }

  sessionDash(){
    Navigator.pushReplacementNamed(context,DashBoardOwner.id);
  }

  sessionRegist(){

    EasyLoading.showSuccess('Please Register your business....');

    Navigator.pushReplacementNamed(context,RegisterOwner.id);
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.grey,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,

    );


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset('assets/images/loo.png',height: 200,),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}