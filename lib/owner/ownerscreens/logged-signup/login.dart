import 'package:eazy_landlord/owner/ownerscreens/logged-signup/wait.dart';
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/waitver.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/register.dart';
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/sign.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../crypt/encrypt.dart';
import '../../../preferences/pref.dart';

import '../../../sqlite/biz.dart';
import '../../ownermodels/business.dart';
import '../../ownerpreferences/bizpref.dart';
import '../../ownerpreferences/shred.dart';
import '../dashboardowner.dart';
import 'forgetpassmail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OwnerLoginScreen extends StatefulWidget {

  static const  String id='login-owner';

  @override
  State<OwnerLoginScreen> createState() => _OwnerLoginScreenState();
}

class _OwnerLoginScreenState extends State<OwnerLoginScreen> {


  final _formKey=GlobalKey<FormState>();
  final _ema=TextEditingController();
  final _pass=TextEditingController();




  // @override
  // void initState() {
  //   getPref();
  //   super.initState();
  // }


  login() async {

    var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/user/login.php'),

        body:{"email":encryp(_ema.text),"password":encryp(_pass.text),});




     // EasyLoading.show(status: 'Logging in .....');


      if(response.statusCode==200){
        var userData=json.decode(response.body);

        String ID=userData['id'];
        String name=userData['name'];
        String email=userData['email'];
        String pass=userData['password'];
        String pic=userData['pic'];
        String num=userData['phone'];
        String log=userData['last_log'];
        String create=userData['create_date'];
        String ad=userData['addr'];
        String lat=userData['lat'];
        String lon=userData['lon'];
        String token=userData['token'];
        String type=userData['type'];
        String status=userData['status'];
        String renew=userData['renew_date'];
        String fcm=userData['fcmid'];


        if(userData=="ERROR"){


          EasyLoading.showError('Login Failed..');


          // showDialog(
          //   context: (context),
          //   builder:(context)=> AlertDialog(
          //     shape:Border.all(color: Colors.grey),
          //     backgroundColor: Colors.red,
          //     title:const Text('Message',style: TextStyle(color: Colors.white),),
          //     content:const Text('Logged In Failed',style: TextStyle(color: Colors.white),) ,
          //     actions:<Widget> [
          //       ElevatedButton(
          //         style: ButtonStyle(
          //           backgroundColor:MaterialStateProperty.all(Colors.lightGreen ),
          //         ),
          //         onPressed:(){
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Cancel',style: TextStyle(color: Colors.white),),),
          //
          //     ],
          //   ),
          // );



        }else{




          if( userData['type']=='owner'){

           // savePref(ID, name, email, num, pass, pic, lon, lat, ad, token, renew, status, type, log, create,fcm);


              //Navigator.pushReplacementNamed(context, WaitVerification.id);


            savePref(ID, name, email, num, pass, pic, lon, lat, ad, token, renew, status, type, log, create,fcm).then((value){

              getPref().then((value){
                Funa();
              });
              //Navigator.pushReplacementNamed(context, WaitVerification.id);
            });


            EasyLoading.showSuccess(' Logged In...');

            // showDialog(
            //   context: (context),
            //   builder:(context)=> AlertDialog(
            //     shape:Border.all(color: Colors.grey),
            //     backgroundColor: Colors.purple,
            //     title:const Text('Message',style: TextStyle(color: Colors.white),),
            //     content:const Text('Logged In Successfully',style: TextStyle(color: Colors.white),) ,
            //     actions:<Widget> [
            //       ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor:MaterialStateProperty.all(Colors.lightGreen ),
            //         ),
            //         onPressed:(){
            //           Navigator.pop(context);
            //         },
            //         child: const Text('Cancel',style: TextStyle(color: Colors.white),),),
            //
            //     ],
            //   ),
            // );

          }else{

            EasyLoading.showError('You are a User use the EazyRent App.');
          }

          print(userData);
        }

      }










  }






  //get business array
  Funa() async {

    var response=await http.post(Uri.parse('https://eazyrent256.com/api/owner/singleBiz.php'),
        headers: {"Accept": "headers/json"},
        body:{'user_id':encryp('$userID')});



    if(response.statusCode==200){

      var jsonData=json.decode(response.body);

      // int ID=jsonData['ID'].toString() as int;
      // String user_id=jsonData['user_id'].toInt();

      // String ID=jsonData['ID'];
      // String user_id=jsonData['user_id'];
      // String logo=jsonData['logo'];
      // String shop=jsonData['shopImage'];
      // String bizname=jsonData['bizname'];
      // String email1=jsonData['email1'];
      // String num1=jsonData['phone1'];
      // String tax=jsonData['taxRegistered'];
      // String tin =jsonData['tinNumber'];
      // String add=jsonData['address'];
      // String  time=jsonData['time1'];
      // String  sta=jsonData['status1'];
      // String serve=jsonData['service'];
      // String op=jsonData['shopOpen'];
      // String rat=jsonData['rating'];
      // String tRat=jsonData['totalRating'];
      // String picked=jsonData['isTopPicked'];
      // String create=jsonData['create_t'];
      // String paidd=jsonData['paid'];
      // String online=jsonData['online'];
      // String cood=jsonData['cod'];
      // String endd=jsonData['end'];
      // String renu=jsonData['renew'];
      // String blok=jsonData['blocked'];








      if(jsonData== 'ERROR'){

        Navigator.pushReplacementNamed(context,RegisterOwner.id);

        EasyLoading.showSuccess('Please Register your business....');

      }else{

        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

        setState(() {
          sharedPreferences.setBool(BusinessInfo.Log,true);
          sharedPreferences.setString(BusinessInfo.ID,jsonData['ID'].toString());
          sharedPreferences.setString(BusinessInfo.user_id, jsonData['user_id']);
          sharedPreferences.setString(BusinessInfo.logo,jsonData['logo']);
          sharedPreferences.setString(BusinessInfo.shop,jsonData['shopImage']);
          sharedPreferences.setString(BusinessInfo.bizname,jsonData['bizname']);
          sharedPreferences.setString(BusinessInfo.email1,jsonData['email1']);
          sharedPreferences.setString(BusinessInfo.num1, jsonData['phone1']);
          sharedPreferences.setString(BusinessInfo.tax,jsonData['taxRegistered']);
          sharedPreferences.setString(BusinessInfo.tin,jsonData['tinNumber']);
          sharedPreferences.setString(BusinessInfo.add,jsonData['address']);
          sharedPreferences.setString(BusinessInfo.time,jsonData['time1']);
          sharedPreferences.setString(BusinessInfo.sta,jsonData['status1']);
          sharedPreferences.setString(BusinessInfo.serve,jsonData['service']);
          sharedPreferences.setString(BusinessInfo.op,jsonData['shopOpen']);
          sharedPreferences.setString(BusinessInfo.rat, jsonData['rating']);
          sharedPreferences.setString(BusinessInfo.tRat, jsonData['totalRating']);
          sharedPreferences.setString(BusinessInfo.picked, jsonData['isTopPicked']);
          sharedPreferences.setString(BusinessInfo.creat, jsonData['create_t']);
          sharedPreferences.setString(BusinessInfo.paidd,jsonData['paid']);
          sharedPreferences.setString(BusinessInfo.online, jsonData['online']);
          sharedPreferences.setString(BusinessInfo.cood,jsonData['cod']);
          sharedPreferences.setString(BusinessInfo.endd, jsonData['end']);
          sharedPreferences.setString(BusinessInfo.renu, jsonData['renew']);
          sharedPreferences.setString(BusinessInfo.blok, jsonData['blocked']);
        });

        Navigator.pushReplacementNamed(context,DashBoardOwner.id);


        print(jsonData);

      }

    }



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



  savePref(
      String ID ,String name,String email, String num,String pass,String pic ,String lon,String lat,
      String ad,String token,String renew,String status ,String type, String log,String create,String fcm
      ) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    setState(() {
      sharedPreferences.setString(PrefInfo.ID, ID);
      sharedPreferences.setString(PrefInfo.name, name);
      sharedPreferences.setString(PrefInfo.email,email);
      sharedPreferences.setString(PrefInfo.num,num);
      sharedPreferences.setString(PrefInfo.pass, pass);
      sharedPreferences.setString(PrefInfo.pic, pic);
      sharedPreferences.setString(PrefInfo.lon, lon);
      sharedPreferences.setString(PrefInfo.lat, lat);
      sharedPreferences.setString(PrefInfo.ad,ad);
      sharedPreferences.setString(PrefInfo.token, token);
      sharedPreferences.setString(PrefInfo.renew, renew);
      sharedPreferences.setString(PrefInfo.status, status);
      sharedPreferences.setString(PrefInfo.type, type);
      sharedPreferences.setString(PrefInfo.log, log);
      sharedPreferences.setString(PrefInfo.create, create);
      sharedPreferences.setString(PrefInfo.fcm, fcm);
    });

  }


  saveBusiness(String ID,String  user_id,String logo,String shop,String bizname,String email1,String num1,String tax,String tin,
      String add,String time,String sta,String serve,String op,String rat,String tRat,String picked,String create,
      String paidd,String online,String cood,String endd,String renu,String blok) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    setState(() {
      // sharedPreferences.setString(BusinessInfo.ID, ID);
      // sharedPreferences.setString(BusinessInfo.user_id, user_id);
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
      sharedPreferences.setString(BusinessInfo.paidd, paidd);
      sharedPreferences.setString(BusinessInfo.online, online);
      sharedPreferences.setString(BusinessInfo.cood, cood);
      sharedPreferences.setString(BusinessInfo.endd, endd);
      sharedPreferences.setString(BusinessInfo.renu, renu);
      sharedPreferences.setString(BusinessInfo.blok, blok);
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
    final size=MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(

              image: DecorationImage(
                image: AssetImage("assets/images/ty.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //image section
                Image.asset('assets/images/loo.png',height: size.height * 0.2,color: Colors.white,),
                const Text('Welcome Back,',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                const Text('Find the Best Houses for rent,Just Login',style: TextStyle(color: Colors.white,fontSize: 14),),


                //form
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Form(
                        key: _formKey,
                        child:GlassmorphicContainer(
                          width:MediaQuery.of(context).size.width,
                          height:320,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.1),
                                const Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.5),
                              const Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                TextFormField(
                                    controller:_ema,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined),
                                        labelText: 'Email',
                                        hintText: 'Email',
                                        border: OutlineInputBorder()
                                    ),

                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Enter Email';

                                      }
                                      bool _isValid= (EmailValidator.validate(value));
                                      if(_isValid==false){
                                        return 'Enter Valid Email Address';

                                      }
                                      return null;




                                    }
                                ),

                                const SizedBox(height: 10,),

                                TextFormField(
                                    controller:_pass,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.fingerprint),
                                        labelText: 'Password',
                                        hintText: 'Password',
                                        border: const OutlineInputBorder(),
                                        suffixIcon: IconButton(onPressed:(){

                                        }, icon:const Icon(Icons.remove_red_eye_outlined))

                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Enter your Password';

                                      }
                                      return null;
                                    }
                                ),

                                const SizedBox(height: 10,),



                                SizedBox(
                                  width:double.infinity,
                                  child: ElevatedButton(
                                      onPressed:(){

                                        if(_formKey.currentState!.validate()){

                                          login();

                                        }

                                      },
                                      child: Text('Login'.toUpperCase(),style: const TextStyle(color: Colors.white),)
                                  ),
                                ),

                                const SizedBox(height: 2,),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed:(){
                                        //Navigator.pushReplacementNamed(context, SignUpScreen.id);

                                      },
                                      child:Text('Forgot Password ? ',style: TextStyle(color: Colors.white,fontSize: 12))
                                  ),
                                ),

                                TextButton(
                                    onPressed:(){
                                      Navigator.pushReplacementNamed(context, OwnerSignUpScreen.id);

                                    },
                                    child:const Text.rich(
                                        TextSpan(
                                            text:'Do not Have an Account  ',style: TextStyle(color: Colors.black,fontSize: 12),
                                            children:[
                                              TextSpan(
                                                text:'Sign Up?',style: TextStyle(color: Colors.white,fontSize: 12),
                                              )
                                            ]
                                        )
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
