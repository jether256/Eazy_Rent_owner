
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../crypt/encrypt.dart';
import 'dart:io';


import '../../../preferences/pref.dart';
import '../../ownermodels/ownermodel.dart';
import '../../ownerpreferences/bizpref.dart';
import '../../widget/custom_drawer.dart';
import '../logged-signup/login.dart';
import '../logged-signup/sign.dart';

class AddWare extends StatefulWidget {
  static const  String id='add ware';


  @override
  State<AddWare> createState() => _AddWareState();
}

class _AddWareState extends State<AddWare>{





final _titleController=TextEditingController();
final _descController=TextEditingController();
final _priceController=TextEditingController();
final _bedrooms=TextEditingController();
final _bathrooms=TextEditingController();
final _fun=TextEditingController();
final _sqft=TextEditingController();
final _carpet=TextEditingController();
final _floors=TextEditingController();
final _con=TextEditingController();
final  _addressController=TextEditingController();
final  _placeController=TextEditingController();
final  _kitchenController=TextEditingController();


final _fomkey=GlobalKey<FormState>();
final _price=TextEditingController();

XFile? _mage1;
XFile? _mage2;
XFile? _mage3;
XFile? _mage4;
XFile? _mage5;



final ImagePicker _picker = ImagePicker();






Future<XFile?> _pickImage() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxHeight:600 ,maxWidth:900 ,imageQuality: 100);
  return image;
}

List apartmentType=[
  'Apartments',
  'Farm Houses',
  'Houses and Villas'
];

List fun=[
  'Furnished',
  'Semi-furnished',
  'Unfurnished'
];

List con=[
  'New Launch',
  'Ready to Move',
  'Under Construction'
];

List places=[
  'Ntinda',
  'Najera',
  'Bweyogerere',
  'Kulambiro',
  'Kololo'
];


List number=[
  '1',
  '2',
  '3',
  '4',
  '4+'
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

@override
void initState() {
  getPref();
  getBusiness();
  showAdu();
  super.initState();
}


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

_scaffold(message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
    action: SnackBarAction(label: 'Ok', onPressed: () {
      ScaffoldMessenger.of(context).clearSnackBars();
    },),));
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


    //address
    Widget _add() {
      return Expanded(
        child: Dialog(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //going to use it so many times lets create our own app bar
              AppBar(
                elevation: 1,
                backgroundColor: Colors.blue,
                iconTheme:const IconThemeData(color: Colors.white),
                title: const Text('Address',style: TextStyle(color: Colors.white),),


              ),


              FutureBuilder(
                future: showAdu(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listAdd.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              _addressController.text = listAdd[index].ad;
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            listAdd[index].ad, style: const TextStyle(
                              fontSize: 15, color: Colors.black),),
                        );
                      });
                },
              ),
            ],

          ),
        ),
      );
    }



    //furnished
    showFun(fun,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                elevation: 1,
                backgroundColor: Colors.blue,
                iconTheme:const IconThemeData(color: Colors.white),
                title: const Text('Furnishing status',style: TextStyle(color: Colors.white),),


              ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount:fun.length ,
                  itemBuilder:(BuildContext context,int index){

                    return ListTile(
                      onTap: (){
                        setState(() {
                          _textController.text=fun[index];
                        });
                        Navigator.pop(context);

                      },
                      title:Text(fun[index]),
                    );

                  }),

            ],
          ),
        );
      });
    }

    //construction
    showCon(con,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                elevation: 1,
                backgroundColor: Colors.blue,
                iconTheme:const IconThemeData(color: Colors.white),
                title: const Text('Construction status',style: TextStyle(color: Colors.white),),


              ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount:con.length ,
                  itemBuilder:(BuildContext context,int index){

                    return ListTile(
                      onTap: (){
                        setState(() {
                          _textController.text=con[index];
                        });
                        Navigator.pop(context);

                      },
                      title:Text(con[index]),
                    );

                  }),

            ],
          ),
        );
      });
    }


    //places
    showPlace(places,_textController){
      return showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                elevation: 1,
                backgroundColor: Colors.blue,
                iconTheme:const IconThemeData(color: Colors.white),
                title: const Text('Location',style: TextStyle(color: Colors.white),),


              ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount:places.length ,
                  itemBuilder:(BuildContext context,int index){

                    return ListTile(
                      onTap: (){
                        setState(() {
                          _textController.text=places[index];
                        });
                        Navigator.pop(context);

                      },
                      title:Text(places[index]),
                    );

                  }),

            ],
          ),
        );
      });
    }



    return  Scaffold(
      appBar: AppBar(
        title: const Text('Add Ware Houses ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
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
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Form(
          key: _fomkey,
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ware Houses'),



                TextFormField(
                  controller: _titleController,
                  autofocus: false,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      labelText: 'Add title*',
                      helperText: 'Mention key features'
                  ),
                  validator: (value){

                    if(value!.isEmpty){

                      return 'Please enter Description';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 10,),

                Container(
                  child: Column(
                    children: [


                      InkWell(
                        onTap: (){

                          showFun(fun,_fun);
                        },
                        child: TextFormField(
                          controller: _fun,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Furnishing',
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Please enter required input';
                            }

                            return null;

                          },
                        ),
                      ),

                      InkWell(
                        onTap: (){

                          showCon(con,_con);
                        },
                        child: TextFormField(
                          controller: _con,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Construction status',
                          ),
                          validator: (value){

                            if(value!.isEmpty){

                              return 'Please enter construction status';
                            }

                            return null;

                          },
                        ),



                      ),

                      TextFormField(
                        keyboardType:TextInputType.number,
                        controller: _sqft,

                        decoration: const InputDecoration(
                          labelText: 'Building Sqft',
                        ),
                        validator: (value){

                          if(value!.isEmpty){

                            return 'Please enter number of SQft';
                          }

                          return null;

                        },
                      ),

                      TextFormField(
                        controller: _carpet,
                        keyboardType:TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Carpet Sqft',
                        ),
                        validator: (value){

                          if(value!.isEmpty){

                            return 'Please enter number of Carpet SqFt';
                          }

                          return null;

                        },
                      ),


                    ],
                  ),
                ),


                const SizedBox(height: 10,),
                // const Divider(color: Colors.grey,),

                TextFormField(
                  controller: _priceController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price*',
                    prefixText: "Shs",
                  ),
                  validator: (value){

                    if(value!.isEmpty){

                      return 'Please enter Price';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 10,),
                // const Divider(color: Colors.grey,),

                TextFormField(
                  controller: _descController,
                  autofocus: false,
                  maxLength: 4000,
                  minLines: 1,
                  maxLines: 30,
                  decoration: const InputDecoration(
                      labelText: 'Description*',
                      helperText: 'Include condition,features and the rent range'
                  ),
                  validator: (value){

                    if(value!.isEmpty){

                      return 'Please enter Description';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 10,),
                // const Divider(color: Colors.grey,),

                // InkWell(
                //   onTap: (){
                //
                //     //lets show the list of cars instead of manually typing
                //     showDialog(
                //         context: context, builder: (BuildContext context) {
                //       return _add();
                //     });
                //
                //
                //   },
                //   child: TextFormField(
                //     controller: _addressController,
                //     enabled: false,
                //     maxLines: 4,
                //     minLines: 2,
                //     decoration: const InputDecoration(
                //         labelText: 'Address*',
                //         helperText: 'Property location',
                //         suffixIcon: Icon(Icons.arrow_forward_ios,size:12,)
                //     ),
                //     validator: (value){
                //
                //       if(value!.isEmpty){
                //
                //         return 'Please enter Address';
                //       }
                //
                //       return null;
                //
                //     },
                //   ),
                // ),
                //
                // const SizedBox(height: 10,),

                TextFormField(
                  controller: _placeController,
                  decoration: const InputDecoration(
                      labelText: 'Location',
                      helperText: 'Eg,Najjera,Mutongo'
                  ),
                  validator: (value){

                    if(value!.isEmpty){

                      return 'Please enter Location';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 10,),

                const Text('Click icons below to add 5 images'),
                Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            _mage1 == null ?

                            InkWell(
                              onTap:(){
                                _pickImage().then((value) {
                                  setState(() {
                                    _mage1 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                                child: const FittedBox(
                                    child:Icon(CupertinoIcons.photo_on_rectangle)),
                              ),
                            ):InkWell(
                              onTap:(){

                                _pickImage().then((value) {
                                  setState(() {
                                    _mage1 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  image: DecorationImage(
                                      image: FileImage(File(_mage1!.path),),
                                      fit: BoxFit.cover

                                  ),

                                ),
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: NeumorphicButton(
                            //         style: NeumorphicStyle(color:Theme.of(context).primaryColor),
                            //         child: const Center(child: Text('Upload image',style: TextStyle(color: Colors.white),)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            _mage2 == null ?

                            InkWell(
                              onTap:(){
                                _pickImage().then((value) {
                                  setState(() {
                                    _mage2 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                                child: const FittedBox(
                                    child:Icon(CupertinoIcons.photo_on_rectangle)),
                              ),
                            ):InkWell(
                              onTap:(){

                                _pickImage().then((value) {
                                  setState(() {
                                    _mage2 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  image: DecorationImage(
                                      image: FileImage(File(_mage2!.path),),
                                      fit: BoxFit.cover

                                  ),

                                ),
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: NeumorphicButton(
                            //         style: NeumorphicStyle(color:Theme.of(context).primaryColor),
                            //         child: const Center(child: Text('Upload image',style: TextStyle(color: Colors.white),)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],),

                Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            _mage3 == null ?

                            InkWell(
                              onTap:(){
                                _pickImage().then((value) {
                                  setState(() {
                                    _mage3 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                                child: const FittedBox(
                                    child:Icon(CupertinoIcons.photo_on_rectangle)),
                              ),
                            ):InkWell(
                              onTap:(){

                                _pickImage().then((value) {
                                  setState(() {
                                    _mage3 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  image: DecorationImage(
                                      image: FileImage(File(_mage3!.path),),
                                      fit: BoxFit.cover

                                  ),

                                ),
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: NeumorphicButton(
                            //         style: NeumorphicStyle(color:Theme.of(context).primaryColor),
                            //         child: const Center(child: Text('Upload image',style: TextStyle(color: Colors.white),)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            _mage4 == null ?

                            InkWell(
                              onTap:(){
                                _pickImage().then((value) {
                                  setState(() {
                                    _mage4 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                                child: const FittedBox(
                                    child:Icon(CupertinoIcons.photo_on_rectangle)),
                              ),
                            ):InkWell(
                              onTap:(){

                                _pickImage().then((value) {
                                  setState(() {
                                    _mage4 = value;
                                  });
                                });
                              },
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  image: DecorationImage(
                                      image: FileImage(File(_mage4!.path),),
                                      fit: BoxFit.cover

                                  ),

                                ),
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: NeumorphicButton(
                            //         style: NeumorphicStyle(color:Theme.of(context).primaryColor),
                            //         child: const Center(child: Text('Upload image',style: TextStyle(color: Colors.white),)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      _mage5 == null ?

                      InkWell(
                        onTap:(){
                          _pickImage().then((value) {
                            setState(() {
                              _mage5 = value;
                            });
                          });
                        },
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          child: const FittedBox(
                              child:Icon(CupertinoIcons.photo_on_rectangle)),
                        ),
                      ):InkWell(
                        onTap:(){

                          _pickImage().then((value) {
                            setState(() {
                              _mage5 = value;
                            });
                          });
                        },
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            image: DecorationImage(
                                image: FileImage(File(_mage5!.path),),
                                fit: BoxFit.cover

                            ),

                          ),
                        ),
                      ),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: NeumorphicButton(
                      //         style: NeumorphicStyle(color:Theme.of(context).primaryColor),
                      //         child: const Center(child: Text('Upload image',style: TextStyle(color: Colors.white),)),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

                const Divider(color: Colors.grey,),
                const SizedBox(height: 70,),
              ],
            ),
          ) ,
        ),
      ),
      bottomNavigationBar:Row(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: NeumorphicButton(
                style: NeumorphicStyle(color: Theme.of(context).primaryColor),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('save',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                onPressed: () async{


                  if (_mage1 == null) {
                    _scaffold(' Image 1 not Selected');
                    return;
                  }

                  if (_mage2 == null) {
                    _scaffold(' Image 2 not Selected');
                    return;
                  }

                  if (_mage3 == null) {
                    _scaffold(' Image 3 not Selected');
                    return;
                  }

                  if (_mage4 == null) {
                    _scaffold(' Image 4 not Selected');
                    return;
                  }

                  if (_mage5 == null) {
                    _scaffold(' Image 5 not Selected');
                    return;
                  }



                  if (_fomkey.currentState!.validate()) {


                    if(_fun.text!='' && _con.text!='' &&
                        _sqft.text!='' && _carpet.text!=''
                        && _priceController.text !=''
                        && _titleController.text!='' && _descController.text!=''
                        && _placeController.text!=''){


                      setState(() async {

                        EasyLoading.show(status: 'Saving .....');

                        var request=http.MultipartRequest('Post',Uri.parse('https://eazyrent256.com/api/owner/addWare.php'));
                        request.fields['user_id']=encryp('$userID');
                        request.fields['owner']=encryp('$name');
                        request.fields['phone']=encryp('$num');
                        request.fields['bizname']=encryp('$bizname');
                        request.fields['num']=encryp('$num1');
                        request.fields['mail']=encryp('$email1');


                        var photo1 = await http.MultipartFile.fromPath('photo', _mage1!.path);
                        request.files.add(photo1);

                        var photo2 = await http.MultipartFile.fromPath('photoo', _mage2!.path);
                        request.files.add(photo2);

                        var photo3 = await http.MultipartFile.fromPath('photooo', _mage3!.path);
                        request.files.add(photo3);

                        var photo4 = await http.MultipartFile.fromPath('photoooo', _mage4!.path);
                        request.files.add(photo4);

                        var photo5 = await http.MultipartFile.fromPath('photooooo', _mage5!.path);
                        request.files.add(photo5);


                        request.fields['price']=encryp(_priceController.text);
                        request.fields['title']=encryp(_titleController.text);
                        request.fields['descc']=encryp(_descController.text);
                        request.fields['adu']=encryp('0');
                        request.fields['place']=encryp(_placeController.text);
                        // request.fields['bed']=encryp(_bedrooms.text);
                        // request.fields['bath']=encryp(_bathrooms.text);
                        request.fields['fun']=encryp(_fun.text);
                        request.fields['con']=encryp(_con.text);
                        request.fields['bsqft']=encryp(_sqft.text);
                        request.fields['csqft']=encryp(_carpet.text);
                        // request.fields['floors']=encryp(_floors.text);
                        // request.fields['kitchen']=encryp(_kitchenController.text);
                        request.fields['lon'] = encryp('0');
                        request.fields['lat'] = encryp('0');

                        var response=await request.send();

                        if(response.statusCode==200){

                          EasyLoading.showSuccess(' Saved...');

                        }else{

                          EasyLoading.showError('Failed to save..');

                        }

                      });






                    }

                  }



                  // showDialog(context: context,
                  //     builder:(BuildContext context){
                  //
                  //   return Dialog(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(20.0),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //
                  //           const Text("Confirm",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  //           const SizedBox(height: 10,),
                  //
                  //           const Text("Are you sure you want to save"),
                  //
                  //           const SizedBox(height: 10,),
                  //
                  //           ListTile(
                  //             leading:Container(
                  //               height: 120,
                  //               width: MediaQuery.of(context).size.width,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.lightBlue,
                  //                 image: DecorationImage(
                  //                     image: FileImage(File(_mage1!.path),),
                  //                     fit: BoxFit.cover
                  //
                  //                 ),
                  //
                  //               ),
                  //             ),
                  //             title: Text(''),
                  //             subtitle: Text(''),
                  //           )
                  //
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  //     });

                },
              ),
            ),
          )
        ],
      ),
      // bottomSheet:
    );
  }
}
