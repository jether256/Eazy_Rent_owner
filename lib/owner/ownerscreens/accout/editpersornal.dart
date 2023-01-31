
import 'package:eazy_landlord/owner/ownerscreens/logged-signup/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../crypt/encrypt.dart';
import '../../../preferences/pref.dart';
import '../../ownermodels/ownermodel.dart';
import '../../ownermodels/servicemodel.dart';
import '../../ownerpreferences/bizpref.dart';
import '../../widget/custom_drawer.dart';
import '../logged-signup/sign.dart';


class EditPersonalAccount extends StatefulWidget {

  static const  String id='edit personal Account';

  @override
  State<EditPersonalAccount> createState() => _EditPersonalAccountState();
}

class _EditPersonalAccountState extends State<EditPersonalAccount> {


  final _formKey=GlobalKey<FormState>();

  final _name=TextEditingController();
  final _num=TextEditingController();
  final _ema=TextEditingController();
  final _pass=TextEditingController();



  @override
  void initState() {
   getPref().then((value){
     getData();
   });

    super.initState();
  }


  getData() async{

    setState(() {
      _name.text='${name}';
      _num.text='${num}';
      _ema.text='${email}';
      // _pass.text='${pass}';
    });


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


  //owners address

  //late List adu = [];
  List<OwnerModel> listAdd = [];
  Future showAdu() async {
    var response = await http.post(
        Uri.parse("https://eazyrent.000webhostapp.com/api/owner/loc.php"),
        headers: {"Accept": "headers/json"}, body: {'id': '$userID'});
    if (response.statusCode == 200) {
      // var jsonData = json.decode(response.body);
      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          listAdd.add(OwnerModel.fromJson(item));
        }
      });

      // setState(() {
      //   adu = jsonData;
      // });
      // print(jsonData);
      // return jsonData;
    }
  }



  //rent categories
  //late List type1 = [];
  List<CategoryModel> type1 = [];

  Future showType() async {
    var response = await http.get(
        Uri.parse("https://eazyrent.000webhostapp.com/api/owner/category.php"),
        headers: {"Accept": "headers/json"});
    if (response.statusCode == 200) {


      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          type1.add(CategoryModel.fromJson(item));
        }
      });


    }
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

  _scaffold(message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
      action: SnackBarAction(label: 'Ok',onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
  }

  @override
  Widget build(BuildContext context) {


    final size=MediaQuery.of(context).size;




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Account ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //form
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: _formKey,
                          child:Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                TextFormField(
                                    controller: _name,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline_outlined),
                                      labelText: 'Full Name',
                                      hintText: 'Full Name',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Enter your Name';

                                      }
                                      return null;
                                    }
                                ),

                                const SizedBox(height: 10,),

                                TextFormField(
                                    controller: _num,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.call),
                                        labelText: 'Phone No',
                                        hintText: 'Phone No',
                                        border: OutlineInputBorder()
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Enter your Phone Number';

                                      }
                                      return null;
                                    }
                                ),

                                const SizedBox(height: 10,),

                                TextFormField(
                                    controller: _ema,
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
                                    controller: _pass,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.call),
                                        labelText: 'Password',
                                        hintText: 'Password',
                                        border: OutlineInputBorder()
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Password';

                                      }
                                      return null;
                                    }
                                ),


                                const SizedBox(height: 10,),

                                SizedBox(
                                  width:double.infinity,
                                  child: ElevatedButton(
                                      onPressed:() async {

                                        EasyLoading.show(status: 'Editing .....');

                                        if(_formKey.currentState!.validate()) {
                                          var response = await http.post(
                                              Uri.parse(
                                                  'https://eazyrent256.com/api/owner/businesses/editaccount.php'),
                                              headers: {
                                                "Accept": "headers/json"
                                              },
                                              body: {
                                                "id": encryp('${userID}'),
                                                "name": encryp(_name.text),
                                                "phone": encryp(_num.text),
                                                "email": encryp(_ema.text),
                                                "pass": encryp(_pass.text),
                                              });


                                          if (response.statusCode == 200) {

                                            EasyLoading.showSuccess(' Account Edited.....');

                                            signOut().then((value){

                                              signOut2();
                                            });


                                          } else {



                                          }


                                        }




                                      },
                                      child: Text('Update'.toUpperCase(),style: const TextStyle(color: Colors.white),)
                                  ),
                                ),

                                const SizedBox(height:40,),


                              ],
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

      ),
    );
  }
  }

