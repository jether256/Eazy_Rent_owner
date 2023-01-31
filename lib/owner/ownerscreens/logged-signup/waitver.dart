
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../preferences/pref.dart';
import 'login.dart';

class VerificationPAge extends StatefulWidget {


  static const  String id='verification';

  @override
  State<VerificationPAge> createState() => _VerificationPAgeState();
}

class _VerificationPAgeState extends State<VerificationPAge> {


  @override
  void initState() {
    getPref();
    super.initState();
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
  String? ID,user_id,logo,shop,bizname,email1,num1,tax,tin,add,time, sta, serve,op,rat,tRat,picked,crete,paid,on,cod,end,renu,blok;


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

    Navigator.pushReplacementNamed(context,OwnerLoginScreen.id);
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                //
                // Center(
                //   child: SizedBox(
                //     height:80 ,
                //     width: 80,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(4),
                //       child: CachedNetworkImage(
                //         //imageUrl:widget.logo,
                //         imageUrl:'https://mymusawoee.000webhostapp.com/api/owner/logo/${biz[index]['logo']}',
                //         placeholder: (context,url)=>Container(
                //           height: 80,
                //           width: 80,
                //           color: Colors.grey.shade300,
                //         ),
                //       ),
                //     ),
                //
                //   ),
                // ),

                const SizedBox(height: 10,),

                //Text(widget.biz,style: const TextStyle(fontSize: 22),),
                InkWell(
                  onTap: (){
                    signOut();

                  },
                    child: Text('log out',style: const TextStyle(fontSize: 22),)),

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
