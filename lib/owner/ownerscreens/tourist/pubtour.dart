
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../mainprovider/housepro.dart';
import '../../../preferences/pref.dart';
import '../../ownermodels/housemodel.dart';

import 'addtour.dart';
import 'edittour.dart';


class TouristList extends StatefulWidget {
  const TouristList({Key? key}) : super(key: key);

  @override
  State<TouristList> createState() => _TouristListState();
}

class _TouristListState extends State<TouristList> {




  final StreamController<List> _streamController2 = StreamController<List>();
  Timer? _timer;




  @override
  void initState() {
    getPref();

    showHouse();


    //Check the server every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) => showHouse());
    super.initState();
  }


  @override
  void dispose() {
    //cancel the timer
    if (_timer!.isActive) _timer!.cancel();

    super.dispose();
  }


  late Box box;
  List data=[];

  Future openBox() async{
    var dir= await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box=await Hive.openBox('tour');
    return;
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

  Future showHouse() async {

    await openBox();


    try{

      var response=await http.post(Uri.parse('https://eazyrent256.com/api/owner/businesses/tourist/getRent.php'),
          body:{'user_id':'$userID'});
      if (response.statusCode == 200) {

        List data = json.decode(response.body);
        //Add your data to stream
        _streamController2.add(data);

        await putData(data);

      }

    }catch(SocketException){

      print('No Internet');

    }

    //get data from DB
    var myMap=box.toMap().values.toList();
    if(myMap.isEmpty){

      data.add('empty');

    }else{

      data=myMap;
    }

    return Future.value(true);
  }


  Future putData(data) async{
    await box.clear();
    //insert data

    for(var d in data){
      box.add(d);
    }
  }







  // late List listAdd = [];
  // Future showHouse() async {
  //   var response=await http.post(Uri.parse('https://eazyrent256.com/api/owner/businesses/tourist/getRent.php'),
  //       body:{'user_id':'$userID'});
  //
  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //
  //
  //     setState(() {
  //       listAdd = jsonData;
  //
  //     });
  //
  //     print(jsonData);
  //     return jsonData;
  //   }
  // }




  @override
  Widget build(BuildContext context) {

    var _housePro=Provider.of<HouseIDProvider>(context);


    return  Container(

      child: StreamBuilder<List>(
        stream: _streamController2.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.hasData) {

            if(data.contains('empty')){


              return   Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('No Tourist B & B Uploaded',style: TextStyle(color: Colors.grey,fontSize: 14),),

                    const Divider(height: 10,),

                    NeumorphicButton(
                      onPressed: (){


                        Navigator.pushReplacementNamed(context,AddTour.id);


                      },
                      style: const NeumorphicStyle(color:Colors.lightBlue),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add_circle,size: 16,color: Colors.white,),
                            Text('Add Tourist B & B',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );


            }else {


              return SingleChildScrollView(
                child: DataTable(
                  showBottomBorder: true,
                  dataRowHeight: 90,
                  horizontalMargin: 0,
                  sortAscending: true,
                  headingRowColor: MaterialStateProperty.all(
                      Colors.grey[200]),
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Tourist B & B')),
                    // DataColumn(label: Text('Image ')),
                    DataColumn(label: Text('Info ')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: snapshot.data.map<DataRow>((e) {
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  const Text('Name:',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),),
                                  Text(e['title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12)),
                                ],
                              ),

                              subtitle:Column(
                                children: [

                                  Container(child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: CachedNetworkImage(
                                        height: 50,
                                        width:50 ,
                                        imageUrl: 'https://eazyrent256.com/api/owner/mage1/${e['image1']}'),
                                  ),),

                                  Row(
                                    children: [
                                      const Text('B & B ID:',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),),

                                      Text('${e['pro_id']}',
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              fontSize: 12)),
                                    ],
                                  ),

                                ],
                              ),

                            ),
                          ),
                        ),

                        // DataCell(
                        //     Container(child: Padding(
                        //       padding: const EdgeInsets.all(3.0),
                        //       child: CachedNetworkImage(
                        //           width:50 ,
                        //           imageUrl: 'https://bodayo.000webhostapp.com/api/owner/product/${e['image']}'),
                        //     ),)
                        // ),


                        DataCell(
                            IconButton(onPressed: ()
                            {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>EditTour(
                                  Id:'${e['ID']}',uid:'${e['user_id']}',own:'${e['owner']}',fon:'${e['phone']}',
                                  biz:'${e['bizname']}',num:'${e['num']}',mail:'${e['mail']}',
                                  im1:'${e['image1']}',im2:'${e['image2']}',im3:'${e['image3']}',im4:'${e['image4']}',
                                  im5:'${e['image5']}', tit:'${e['title']}',pr:'${e['price']}',desc:'${e['descc']}',adu:'${e['adu']}',
                                  lat:'${e['lat']}', lon:'${e['lon']}',place:'${e['place']}',bed:'${e['bed']}',bath:'${e['bath']}',
                                  fun:'${e['fun']}', con:'${e['con']}',b:'${e['bsqft']}',c:'${e['csqft']}',flo:'${e['floors']}',
                                  kit:'${e['kitchen']}', paid:'${e['paid']}',start:'${e['start']}',end:'${e['end']}',blo:'${e['blocked']}',
                                  type:'${e['type']}', proi:'${e['pro_id']}'
                              )));
                            },
                              icon:const Icon(Icons.info_outline),
                            )
                        ),


                        DataCell(
                          Container(
                            child: IconButton(onPressed: () {

                              Delete('${e['pro_id']}');


                            }, icon:const Icon(Icons.delete,color: Colors.red,) ,

                          ),

                        ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );

            }
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


}

void Delete(String s) async{

 // EasyLoading.show(status: 'Deleting .....');

  var response=await http.post(Uri.parse('https://eazyrent256.com/api/owner/businesses/tourist/delete.php'),
      headers: {"Accept": "headers/json"},
      body:{"pro_id":s});

  if(response.statusCode==200){

    EasyLoading.showSuccess('Tourist B & B deleted...');


  }else{

    EasyLoading.showError('Failed to delete...');
  }

}



