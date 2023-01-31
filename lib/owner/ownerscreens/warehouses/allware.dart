import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazy_landlord/owner/ownerscreens/warehouses/waredetail.dart';
import 'package:http/http.dart' as http;
import 'package:eazy_landlord/owner/ownerscreens/warehouses/pubware.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../preferences/pref.dart';
import '../../widget/custom_drawer.dart';
import 'addware.dart';

class AllWare extends StatefulWidget {
  static const  String id='all ware';


  @override
  State<AllWare> createState() => _AllWareState();
}

class _AllWareState extends State<AllWare> {

  @override
  void initState() {
    getPref();
    showProducts();
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



  late  List searchList=[];
  showProducts() async{

    // var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/owner/businesses/apartment/getallApart.php'),
    //     body:{'user_id':'$userID'});


    var response = await http.get(Uri.parse("https://eazyrent256.com/api/owner/businesses/apartment/getallApart.php"),headers:{"Accept":"headers/json"});
    if(response.statusCode ==200){
      var jsonData=json.decode(response.body);
      for(var i=0;i<jsonData.length;i++){
        // searchList.add(jsonData[i]['pro_id']);
        // // searchList.add(jsonData[i]['type']);
        // searchList.add(jsonData[i]['price']);
        // searchList.add(jsonData[i]['place']);
        // searchList.add(jsonData[i]['title']);
        // searchList.add(jsonData[i]['descc']);
        // searchList.add(jsonData[i]['adu']);
        searchList.add(jsonData[i]['bizname']);
        // searchList.add(jsonData[i]['owner']);
      }
      print(searchList);
      //return jsonData;

    }

  }


  var totalapart;
  Future totalRent() async {
    var response=await http.post(Uri.parse('https://www.eazyrent256.com/api/owner/businesses/apartment/totalrental.php'),
        body:{'user_id':'$userID'});

    if (response.statusCode == 200) {

      setState(() {

        totalapart=json.decode(response.body);
      });

    }
    print(totalapart);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ware Houses',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        elevation: 0,
        actions:  [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color:Colors.white,
              child:const Text('Add',style: TextStyle(color: Colors.lightBlue),),
              onPressed:(){
                Navigator.pushReplacementNamed(context,AddWare.id);
              },
            ),
          ),

        ],
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.lightBlue,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: (){
                        showSearch(context: context, delegate:SearchAds(list:searchList));
                      },
                      decoration: InputDecoration(
                        hintText: 'Search ',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body:Column(
        children: [
          Material(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      child: Row(
                        children: const [
                          Text('Ware Houses'),
                          SizedBox(width:10),
                          CircleAvatar(
                            backgroundColor: Colors.black54,
                            maxRadius: 8,
                            child: FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('20',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          )
                        ],

                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),


           Expanded(
            child: WareHouseList(),
          ),
        ],
      ),
    );
  }
}

class SearchAds extends SearchDelegate<String>{

  List<dynamic> list;
  SearchAds({required this.list});

  showAllProducts() async{

    var response = await http.post(
        Uri.parse('https://www.eazyrent256.com/api/owner/businesses/apartment/search.php'),
        body: {
          "search":query,
        });
    if(response.statusCode ==200){
      var jsonData=json.decode(response.body);
      return jsonData;

    }

  }


  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        onPressed:(){
          query="";
          showSuggestions(context);

        },
        icon:const Icon(Icons.close),
      )

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(onPressed:(){
      close(context,"");
    },icon:const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder<dynamic>(
        future: showAllProducts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  var lists=snapshot.data[index];

                  final _format=NumberFormat('##,###,##0');
                  var _price=int.parse(lists['price']);//convert to int
                  String _formattedPrice='\Shs ${_format.format(_price)}';


                  //
                  // var date=DateTime.DateTime.fromMicrosecondsSinceEpoch(lists['date']);
                  // var _date=DateFormat.yMMM().format(date);


                  return InkWell(
                    onTap: (){

                      //
                      //
                      // _roomDetails.getselectedChart(lists['ID'],lists['user_id'],lists['owner'],lists['phone'],lists['bizname'],lists['num'],
                      //     lists['mail'],lists['image1'],lists['image2'],lists['image3'],lists['image4'],lists['image5'],lists['title'],lists['price'],lists['descc'],
                      //     lists['adu'],lists['lat'],lists['lon'],lists['place'],lists['bed'],lists['bath'],lists['fun'],lists['con'],lists['bsqft'],lists['csqft'],
                      //     lists['floors'],lists['kitchen'],lists['paid'], lists['start'],lists['end'],lists['blocked'],lists['type'],lists['pro_id']);
                      //

                      //
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>WareDetail(
                          Id:'${lists['ID']}',uid:'${lists['user_id']}',own:'${lists['owner']}',fon:'${lists['phone']}',
                          biz:'${lists['bizname']}',num:'${lists['num']}',mail:'${lists['mail']}',
                          im1:'${lists['image1']}',im2:'${lists['image2']}',im3:'${lists['image3']}',im4:'${lists['image4']}',
                          im5:'${lists['image5']}', tit:'${lists['title']}',pr:'${lists['price']}',desc:'${lists['descc']}',adu:'${lists['adu']}',
                          lat:'${lists['lat']}', lon:'${lists['lon']}',place:'${lists['place']}',bed:'${lists['bed']}',bath:'${lists['bath']}',
                          fun:'${lists['fun']}', con:'${lists['con']}',b:'${lists['bsqft']}',c:'${lists['csqft']}',flo:'${lists['floors']}',
                          kit:'${lists['kitchen']}', paid:'${lists['paid']}',start:'${lists['start']}',end:'${lists['end']}',blo:'${lists['blocked']}',
                          type:'${lists['type']}', proi:'${lists['pro_id']}'
                      )));

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>  HouseDetails()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 120,
                                child:CachedNetworkImage(
                                  imageUrl:'https://www.eazyrent256.com/api/owner/mage1/${lists['image1']}',fit: BoxFit.cover,
                                  //placeholder: (context, url) =>,
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_formattedPrice,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(lists['title']),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Posted At:${lists['start']}'),
                                    ],
                                  ),


                                ],
                              )
                            ],

                          ),
                        ),
                      ),

                    ),
                  );
                });
          }else{
            return Column(
              children: const [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }

        });

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    var listData=query.isEmpty ? list:list.where((element) => element.toLowerCase().contains(query)).toList();

    return listData.isEmpty ? const Center(child: Text('No Data Found'),):ListView.builder(
        itemCount: listData.length,
        itemBuilder:(context,index){
          return  ListTile(
            onTap: (){
              query=listData[index];
              showResults(context);
            },
            title:Text(listData[index]),
          );
        }
    );
  }

}