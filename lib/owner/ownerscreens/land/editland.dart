import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../crypt/encrypt.dart';

import '../../../preferences/pref.dart';
import '../../ownermodels/ownermodel.dart';
import '../../ownerpreferences/bizpref.dart';
import '../../widget/custom_drawer.dart';
import '../logged-signup/login.dart';
import '../logged-signup/sign.dart';
class Editland extends StatefulWidget {

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


  const Editland({ required this.Id, required this.uid, required this.own, required this.fon, required this.biz, required this.num, required this.mail, required this.im1, required this.im2, required this.im3, required this.im4, required this.im5, required this.tit, required this.pr, required this.desc, required this.adu, required this.lat, required this.lon, required this.place, required this.bed, required this.bath, required this.fun, required this.con, required this.b, required this.c, required this.flo, required this.kit, required this.paid, required this.start, required this.end, required this.blo, required this.type, required this.proi}) ;

  @override
  State<Editland> createState() => _EditlandState();
}

class _EditlandState extends State<Editland> {

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

  final ImagePicker _picker = ImagePicker();

  XFile? _mage1;
  XFile? _mage2;
  XFile? _mage3;
  XFile? _mage4;
  XFile? _mage5;

  int _index=0;

  // late List photos=[
  //   'https://mymusawoee.000webhostapp.com/api/owner/mage1/${widget.im1}',
  //   'https://mymusawoee.000webhostapp.com/api/owner/mage2/${widget.im2}',
  //   'https://mymusawoee.000webhostapp.com/api/owner/mage3/${widget.im3}',
  //   'https://mymusawoee.000webhostapp.com/api/owner/mage4/${widget.im4}',
  //   'https://mymusawoee.000webhostapp.com/api/owner/mage5/${widget.im5}'
  // ];

  @override
  void initState() {
    getHouse();
    getPref();
    getBusiness();
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

  final bool _loading=true;

  getHouse() async{

    setState(() {
      _priceController.text=widget.pr;
      _titleController.text=widget.tit;
      _descController.text=widget.desc;
      _bedrooms.text=widget.bed;
      _bathrooms.text=widget.bath;
      _fun.text=widget.fun;
      _sqft.text=widget.b;
      _carpet.text=widget.c;
      _floors.text=widget.flo;
      _con.text=widget.con;
      _addressController.text=widget.adu;
      _placeController.text=widget.place;
      _kitchenController.text=widget.kit;
      _mage1=widget.im1 as XFile?;
      _mage2=widget.im2 as XFile?;
      _mage3=widget.im3 as XFile?;
      _mage4=widget.im4 as XFile?;
      _mage5=widget.im5 as XFile?;

      //var difference=int.parse(_com.text)-double.parse(_price.text);
      //discount=(double.parse(_price.text)/int.parse(_com.text)*100);
      //discount=(difference/int.parse(_com.text)*100);
    });


  }








  Future<XFile?> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxHeight:600 ,maxWidth:900 ,imageQuality: 100);
    return image;
  }

  List<OwnerModel> listAddd = [];
  Future showAdu() async {
    var response = await http.post(
        Uri.parse("https://eazyrent.000webhostapp.com/api/owner/loc.php"),
        headers: {"Accept": "headers/json"}, body: {'id': '$userID'});
    if (response.statusCode == 200) {
      // var jsonData = json.decode(response.body);
      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          listAddd.add(OwnerModel.fromJson(item));
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
                      itemCount: listAddd.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              _addressController.text = listAddd[index].ad;
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            listAddd[index].ad, style: const TextStyle(
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


   // final _authData = Provider.of<AuthProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Edit Land ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
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
                const Text('Edit Land'),

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 300,
                //   color: Colors.grey.shade300,
                //   child: _loading ? Center(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //
                //         CircularProgressIndicator(
                //           valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                //         ),
                //         const SizedBox(height:10,),
                //
                //         const Text('Loading Rental..'),
                //
                //       ],
                //     ),
                //   ):
                //   Stack(
                //     children: [
                //       Center(
                //         child: PhotoView(
                //           backgroundDecoration: BoxDecoration(
                //             color: Colors.grey.shade300,
                //           ),
                //           imageProvider:NetworkImage(photos[_index]),
                //         ),
                //       ),
                //
                //       Positioned(
                //         bottom: 0.0,
                //         child: Container(
                //           height: 50,
                //           width: MediaQuery.of(context).size.width,
                //           child: ListView.builder(
                //               shrinkWrap: true,
                //               scrollDirection: Axis.horizontal,
                //               physics: const BouncingScrollPhysics(),
                //               itemCount:photos.length ,
                //               itemBuilder:( context, index){
                //
                //                 return    Positioned(
                //                   bottom: 0.0,
                //                   child: InkWell(
                //                     onTap: (){
                //                       setState(() {
                //                         _index=index;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: 60,
                //                       height: 60,
                //                       decoration: BoxDecoration(
                //                         color: Colors.white,
                //                         border: Border.all(
                //
                //                             color: Theme.of(context).primaryColor
                //                         ),
                //                       ),
                //
                //                       child: Image.network(photos[index]),
                //                     ),
                //                   ),
                //                 );
                //
                //               }),
                //         ),
                //       ),
                //     ],
                //   ),
                //
                //
                // ),


                TextFormField(
                  controller: _titleController,
                  autofocus: false,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      labelText: 'Edit title*',
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


                      TextFormField(
                        keyboardType:TextInputType.number,
                        controller: _sqft,

                        decoration: const InputDecoration(
                          labelText: 'Land Ares',
                        ),
                        validator: (value){

                          if(value!.isEmpty){

                            return 'Please enter number of SQft';
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



                TextFormField(
                  controller: _placeController,
                  enabled: false,
                  decoration: const InputDecoration(
                      labelText: 'Location',
                      helperText: 'Eg,Najjera,Mutongo'
                  ),
                ),

                const SizedBox(height: 10,),



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
                  child: Text('Update',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                onPressed: () async{



                  if (_fomkey.currentState!.validate()) {


                    if(
                        _sqft.text!=''
                        && _priceController.text !=''
                        && _titleController.text!='' && _descController.text!=''
                        && _placeController.text!=''){


                      setState(() async {

                        EasyLoading.show(status: 'Updating .....');

                        var response=await http.post(Uri.parse('https://eazyrent256.com/api/owner/businesses/land/updateRental.php'),
                            headers: {"Accept": "headers/json"},
                            body:{
                          'pro_id':encryp(widget.proi),
                          'price':encryp(_priceController.text),
                          'title':encryp(_titleController.text),
                          'descc':encryp(_descController.text),
                          'adu':encryp('0'),
                          'place':encryp(_placeController.text),
                          // 'bed':encryp(_bedrooms.text),
                          // 'bath':encryp(_bathrooms.text),
                          // 'fun':encryp(_fun.text),
                          // 'con':encryp(_con.text),
                          'bsqft':encryp(_sqft.text),
                          // 'csqft':encryp(_carpet.text),
                          // 'floors':encryp(_floors.text),
                          // 'kitchen':encryp(_kitchenController.text),
                          'lon':encryp('0'),
                          'lat':encryp('0'),
                            });


                        if(response.statusCode==200){

                          EasyLoading.showSuccess(' Updated...');

                        }else{

                          EasyLoading.showError('Failed to update...');

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
