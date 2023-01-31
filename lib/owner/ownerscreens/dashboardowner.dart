
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../config/colors.dart';
import '../../preferences/pref.dart';
import '../ownermodels/housemodel.dart';
import '../ownerpreferences/bizpref.dart';
import '../widget/custom_drawer.dart';
import 'logged-signup/login.dart';
import 'logged-signup/sign.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashBoardOwner extends StatefulWidget {

  static const  String id='dash-owner';

  @override
  State<DashBoardOwner> createState() => _DashBoardOwnerState();
}

class _DashBoardOwnerState extends State<DashBoardOwner> {


  bool toggle=false;

  Map<String, double> dataMap = {
    "Rentals": 5,
    "Apartments": 3,
    "Tourist B and B": 2,
    "Ware Houses": 2,
    "Office Space": 2,
    "Land": 2,
    "Bangalows": 2,
    "Hostels": 2,
  };

  List<Color> colorList=[

    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.teal,
    Colors.grey,
    Colors.brown,
    Colors.purple,

  ];

  @override
  void initState() {
    getPref();
    getBusiness();
    totalRent();

    Future.delayed(Duration.zero,() async {
      details = await getDetails();
    });

    super.initState();
  }

   Map<String, String> details = {
    'bizname': '',
    'email1': '',
    'phone1': '',
    // 'bio': '',
  };

  Future<Map<String, String>> getDetails() async {
    final Map<String, String> _details = {
      'bizname': '',
      'email1': '',
      'phone1': '',
      // 'bio': '',
    };

    var storage = const FlutterSecureStorage();
    _details['bizname'] = (await storage.read(key: 'bizname')).toString();
    _details['emaill'] = (await storage.read(key: 'email1')).toString();
    _details['phone1'] = (await storage.read(key: 'phone1')).toString();
    // _details['bio'] = (await storage.read(key: 'bio')).toString();
    return _details;
  }



  //List<HouseModel> listAdd = [];

 // String totalpost='';
  var totalpost;
  Future totalRent() async {
    var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/owner/businesses/totalrental.php'),
        body:{'user_id':'$userID'});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
    //   setState(() {
    //     final data = jsonDecode(response.body);
    //     for (Map item in data) {
    //       listAdd.add(HouseModel.fromJson(item));
    //     }
    //   });

      setState(() {

        totalpost=jsonData;
      });

    }
    print(totalpost);
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

   // int jay= int.parse(totalpost.toString());

    return  Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        elevation: 0,
        actions:  [

          Text(details['email1']!),
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
      drawer: const CustomDrawer(),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [


          Container(
            height:200 ,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount:2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              padding:const EdgeInsets.all(4),
              children: [
                Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(4),
                     color: Colors.green
                   ),
                    child: Center(child: Text('${totalpost}'.toString(),style:TextStyle(color: Colors.white),))
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.lightBlue
                    ),
                    child: const Center(child: Text('Category',style: TextStyle(color: Colors.white),))
                ),
              ],
            ),
          ),

          Container(
            child: Center(

              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                centerText: "HYBRID",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  //legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
          )

        ],
      ),
    );
  }
}
