import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../crypt/encrypt.dart';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../preferences/pref.dart';
import '../../ownermodels/ownermodel.dart';
import '../../ownermodels/servicemodel.dart';
import '../wait.dart';
import 'login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




class RegisterOwner extends StatefulWidget {
  static const  String id='register-owner';

  @override
  State<RegisterOwner> createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {

  String? countryValue;

  String? stateValue;

  String? cityValue;
  String? address;

  List<OwnerModel>? ownerModel;

  final _formKey = GlobalKey<FormState>();
  final _businessName = TextEditingController();
  final _contNum = TextEditingController();
  final _ema = TextEditingController();
  final _gst = TextEditingController();
  final _pin = TextEditingController();
  final _land = TextEditingController();
  final _city = TextEditingController();
  final _sta = TextEditingController();
  final _tipo = TextEditingController();
  final _addressController = TextEditingController();

  String? _bName;
  String? _taxStatus;
  XFile? _shopName;
  XFile? _log;

  bool visibleLoading = false;

  final ImagePicker _picker = ImagePicker();

  Widget _formField(
      {TextEditingController? controller, String? label, TextInputType? type,
        String? Function(String?)? validator}) {
    return TextFormField(
        controller: controller,
        keyboardType: type,

        decoration: InputDecoration(
          labelText: label,
          prefixText: controller == _contNum ? '+256' : null,


        ),
        validator: validator,

        onChanged: (value) {
          if (controller == _businessName) {
            setState(() {
              _bName = value;
            });
          }
        }

    );
  }

  Future<XFile?> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxHeight:600 ,maxWidth:900 ,imageQuality: 100);
    return image;
  }

  _scaffold(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
      action: SnackBarAction(label: 'Ok', onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
      },),));
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

    Navigator.pushReplacementNamed(context, OwnerLoginScreen.id);
  }

  @override
  void initState() {
    getPref();
    showAdu();
    showType();
    super.initState();
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





  @override
  Widget build(BuildContext context) {




    Widget _appBar(title, fieldValue) {
      return AppBar(
        backgroundColor: Colors.lightBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        automaticallyImplyLeading: false,
        title: Text('$title>$fieldValue',
          style: const TextStyle(color: Colors.black, fontSize: 14),),

      );
    }


    Widget _add() {
      return Expanded(
        child: Dialog(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //going to use it so many times lets create our own app bar
              _appBar('Business', 'Address'),

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


    Widget _type() {
      return Dialog(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //going to use it so many times lets create our own app bar
              _appBar('Business', 'Type'),

              FutureBuilder(
                future: showType(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: type1.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              _tipo.text = type1[index].Nem;
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            type1[index].Nem, style: const TextStyle(
                              fontSize: 15, color: Colors.black),),
                        );
                      });
                },
              ),
            ],

          ),

      );
    }




    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 240,
                child: Stack(
                  children: [
                    _shopName == null ?
                    Container(
                        color: Colors.lightBlue,
                        height: 240,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: TextButton(
                          child: const Center(
                            child: Text('Tap to add image',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            _pickImage().then((value) {
                              setState(() {
                                _shopName = value;
                              });
                            });
                          },
                        )
                    ) : InkWell(
                      onTap: () {
                        _pickImage().then((value) {
                          setState(() {
                            _shopName = value;
                          });
                        });
                      },
                      child: Container(
                        height: 240,

                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          image: DecorationImage(
                              opacity: 100,
                              image: FileImage(File(_shopName!.path),),
                              fit: BoxFit.cover

                          ),

                        ),
                      ),
                    ),

                    SizedBox(
                      height: 80,
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        actions: [
                          IconButton(

                              onPressed: () {
                                signOut();
                              },
                              icon: const Icon(
                                Icons.exit_to_app, color: Colors.white,)),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                _pickImage().then((value) {
                                  setState(() {
                                    _log = value;
                                  });
                                });
                              },
                              child: Card(
                                elevation: 4,
                                child: _log == null ? const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Center(child: Text('+')),
                                ) : ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.file(File(_log!.path)),
                                  ),
                                ),

                              ),
                            ),

                            const SizedBox(width: 10,),

                            Text(
                              _bName == null ? '' : _bName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),)

                          ],
                        ),
                      ),

                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: Column(
                  children: [
                    _formField(
                        controller: _businessName,
                        label: 'Business Name',
                        type: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Business Name';
                          }
                        }
                    ),


                    _formField(
                        controller: _contNum,
                        label: 'Contact Number',
                        type: TextInputType.phone,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Contact Number';
                          }
                        }
                    ),

                    _formField(
                        controller: _ema,
                        label: ' Email',
                        type: TextInputType.emailAddress,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          }
                          bool _isValid = (EmailValidator.validate(value));
                          if (_isValid == false) {
                            return 'Enter Valid Email Address';
                          }
                        }
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      children: [

                        const Text('Tax Registered:'),

                        Expanded(
                          child: DropdownButtonFormField(
                              value: _taxStatus,
                              validator: (value) {
                                if (value == null) {
                                  return ' Select Tax status';
                                }
                              },
                              hint: const Text('Select'),
                              items: <String>['Yes', 'No']
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _taxStatus = value;
                                });
                              }
                          ),
                        ),
                      ],
                    ),

                    if(_taxStatus == "Yes")
                      _formField(
                          controller: _gst,
                          label: 'Tin Number',
                          type: TextInputType.number,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Tin Number';
                            }
                          }
                      ),


                    TextFormField(
                      controller: _addressController,
                      maxLines: 4,
                      minLines: 2,
                      enabled: false,
                      //enter manually now

                      decoration: const InputDecoration(
                        labelText: 'Location',
                        counterText: 'Business Location',
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      },

                    ),

                    const SizedBox(height: 10,),

                    // InkWell(
                    //   onTap: () {
                    //     //lets show the list of cars instead of manually typing
                    //     showDialog(
                    //         context: context, builder: (BuildContext context) {
                    //       return _type();
                    //     });
                    //   },
                    //   child: TextFormField(
                    //     controller: _tipo,
                    //     maxLines: 4,
                    //     minLines: 2,
                    //     enabled: false,
                    //     //enter manually now
                    //
                    //     decoration: const InputDecoration(
                    //       labelText: 'Category',
                    //       counterText: 'Category',
                    //     ),
                    //
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please complete enter a Category';
                    //       }
                    //       if (_authData.shopLatitude == null) {
                    //         return 'Please complete enter a Category';
                    //       }
                    //       return null;
                    //     },
                    //
                    //   ),
                    // ),
                    const Divider(color: Colors.grey,),






                    const SizedBox(height: 10,),

                  ],

                ),
              ),
            ],
          ),
        ),

        persistentFooterButtons: [

          Row(
            children: [
              Expanded(

                child: ElevatedButton(
                    onPressed: () async {
                      if (_shopName == null) {
                        _scaffold('User Image not Selected');
                        return;
                      }

                      if (_log == null) {
                        _scaffold('Logo Image not Selected');
                        return;
                      }

                      if (_formKey.currentState!.validate()) {


                      }


                      var request = http.MultipartRequest('Post',
                          Uri.parse('https://eazyrent256.com/api/owner/registerBiz.php'));



                      request.fields['user_id'] =  encryp('$userID');

                      var photo = await http.MultipartFile.fromPath('logo', _shopName!.path);
                      request.files.add(photo);

                      var photo1 = await http.MultipartFile.fromPath('shop', _log!.path);
                      request.files.add(photo1);
                      request.fields['bizname'] = encryp(_businessName.text);
                      request.fields['phone'] = encryp('+256${_contNum.text}');
                      request.fields['email'] = encryp(_ema.text);
                      request.fields['taxRegistered'] =encryp(_taxStatus!);
                      request.fields['tinNumber'] = (_gst.text.isEmpty ? null :encryp( _gst.text))!;
                      request.fields['address'] =encryp(_addressController.text);
                      request.fields['lon'] = encryp('0');
                      request.fields['lat'] = encryp('0');
                      request.fields['service'] = encryp('0');

                      //send request
                      var response = await request.send();

                      //read response from
                      var result = await response.stream.bytesToString();

                      var userData = json.decode(result);

                      if (response.statusCode == 200){


                        if (userData == "ERROR") {

                          showDialog(
                            context: (context),
                            builder: (context) =>
                                AlertDialog(
                                  title: const Text('Message'),
                                  content: const Text('Business Already Exists.'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.lightGreen),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),),

                                  ],
                                ),
                          );
                        }else{

                          Navigator.pushReplacementNamed(context, Wait.id);

                          showDialog(
                            context: (context),
                            builder: (context) =>
                                AlertDialog(
                                  title: const Text('Message'),
                                  content: const Text('Business Registered'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.lightGreen),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),),

                                  ],
                                ),
                          );

                        }

                      } else {


                        showDialog(
                          context: (context),
                          builder: (context) =>
                              AlertDialog(
                                title: const Text('Message'),
                                content: const Text('Business failed to register '),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.lightGreen),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),),

                                ],
                              ),
                        );


                      }




                    },
                    child: const Text(
                      'Register', style: TextStyle(color: Colors.white),)
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
