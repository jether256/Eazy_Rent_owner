
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../preferences/pref.dart';
import '../ownerpreferences/bizpref.dart';
import '../ownerscreens/accout/booking.dart';
import '../ownerscreens/accout/editbiz.dart';
import '../ownerscreens/accout/editpersornal.dart';
import '../ownerscreens/accout/noti.dart';
import '../ownerscreens/accout/report.dart';
import '../ownerscreens/accout/settings.dart';
import '../ownerscreens/apartments/addapart.dart';
import '../ownerscreens/apartments/allapart.dart';
import '../ownerscreens/bangalows/addbang.dart';
import '../ownerscreens/bangalows/allbang.dart';
import '../ownerscreens/dashboardowner.dart';
import '../ownerscreens/homeuser.dart';
import '../ownerscreens/hostels/addhostel.dart';
import '../ownerscreens/hostels/allhostel.dart';
import '../ownerscreens/land/addland.dart';
import '../ownerscreens/land/allland.dart';
import '../ownerscreens/logged-signup/login.dart';
import '../ownerscreens/logged-signup/sign.dart';
import '../ownerscreens/office space/addoffice.dart';
import '../ownerscreens/office space/alloff.dart';
import '../ownerscreens/rentals/addrental.dart';
import '../ownerscreens/rentals/allrentals.dart';
import '../ownerscreens/tourist/addtour.dart';
import '../ownerscreens/tourist/alltour.dart';
import '../ownerscreens/warehouses/addware.dart';
import '../ownerscreens/warehouses/allware.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {



  @override
  void initState() {
    getPref();
    getBusiness();
    super.initState();
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


    Widget _menu({String? menuTitle, IconData? icon,String? route}){
      return ListTile(
        leading: Icon(icon,color: Colors.lightBlue,),
        title: Text(menuTitle!,style: const TextStyle(color: Colors.lightBlue),),
        onTap: (){
          //Navigator.push(context,MaterialPageRoute(builder: (context)=>()));
          Navigator.pushReplacementNamed(context,route!);
        },

      );
    }



    return Drawer(
      child: Column(
        children: [
           UserAccountsDrawerHeader(
            accountName: Text('$bizname'),
            accountEmail:Text('$email1'),
            currentAccountPicture:SizedBox(
              height:80 ,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl:'https://eazyrent256.com/api/owner/logo/${logo}',
                  // imageUrl:'https://mymusawoee.000webhostapp.com/api/owner/logo/${biz[index]['logo']}',
                  placeholder: (context,url)=>Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),

            ),
          ),



          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [



                ListTile(leading: const Icon(Icons.dashboard_outlined,color: Colors.lightBlue,),
                  horizontalTitleGap: 2,
                  title: InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DashBoardOwner() ,
                            )
                        );
                      },
                      child: const Text('Home',style: TextStyle(color: Colors.lightBlue),)),
                ),


                //rentals
                ExpansionTile(
                  leading:Image.asset('assets/images/house.png',height: 30,width: 30,),
                  title:const Text('Rentals',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Rentals',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllRentals() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Rentals',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddRental() ,
                            )
                        );
                      },
                    ),

                  ],
                ),
                //apartment
                ExpansionTile(
                  leading:Image.asset('assets/images/apartment.png',height: 30,width: 30,),
                  title:const Text('Apartments',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Apartments',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllApart() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Apartments',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddApart() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //bangalows
                ExpansionTile(
                  leading:Image.asset('assets/images/home.png',height: 30,width: 30,),
                  title:const Text('Bangalows',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Bangalows',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllBang() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Bangalows',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddBang() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //hostels
                ExpansionTile(
                  leading:Image.asset('assets/images/hostel.png',height: 30,width: 30,),
                  title:const Text('Hostels',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Hostels',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllHostel() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Hostels',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddHostel() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //office
                ExpansionTile(
                  leading:Image.asset('assets/images/worker.png',height: 30,width: 30,),
                  title:const Text('Commercial & Office Space',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Office Space',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Alloff() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Office Space',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddOff() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //land
                ExpansionTile(
                  leading:Image.asset('assets/images/land.png',height: 30,width: 30,),
                  title:const Text('Land',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Land',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllLand() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Land',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddLand() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //ware
                ExpansionTile(
                  leading:Image.asset('assets/images/warehouse.png',height: 30,width: 30,),
                  title:const Text('Ware Houses',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Ware houses',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllWare() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Ware House',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddWare() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                //tourist
                ExpansionTile(
                  leading:Image.asset('assets/images/tourists.png',height: 30,width: 30,),
                  title:const Text('Tourist B & B',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('All Tourist B & B',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AllTour() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Add Tourist B & B',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddTour() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                ExpansionTile(
                  leading: const Icon(CupertinoIcons.person,color: Colors.lightBlue,),
                  title:const Text('Account',style: TextStyle(color: Colors.lightBlue),),
                  children: [

                    ListTile(
                      title: Center(child: const Text('Edit Personal Account',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  EditPersonalAccount() ,
                            )
                        );

                      },
                    ),

                    ListTile(
                      title: Center(child: const Text('Edit Business Account',style: TextStyle(color: Colors.lightBlue),)),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  EditBizAccount() ,
                            )
                        );
                      },
                    ),

                  ],
                ),

                ListTile(leading: const Icon(Icons.notification_important,color: Colors.lightBlue,),
                  horizontalTitleGap: 2,
                  title: InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Notifications() ,
                            )
                        );
                      },
                      child: const Text('Notifications',style: TextStyle(color: Colors.lightBlue),)),
                ),

                ListTile(leading: const Icon(Icons.list_alt_outlined,color: Colors.lightBlue,),
                  horizontalTitleGap: 2,
                  title: InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Bookings() ,
                            )
                        );
                      },
                      child: const Text('Bookings',style: TextStyle(color: Colors.lightBlue),)),
                ),

                ListTile(leading: const Icon(Icons.stacked_bar_chart,color: Colors.lightBlue,),
                  horizontalTitleGap: 2,
                  title: InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Report() ,
                            )
                        );
                      },
                      child: const Text('Reports',style: TextStyle(color: Colors.lightBlue),)),
                ),

                ListTile(leading: const Icon(Icons.settings,color: Colors.lightBlue,),
                  horizontalTitleGap: 2,
                  title: InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Settingz() ,
                            )
                        );
                      },
                      child: const Text('Settings',style: TextStyle(color: Colors.lightBlue),)),
                ),






                //
                // ExpansionTile(
                //   leading:Image.asset('assets/images/house.png',height: 30,width: 30,),
                //   title:const Text('Rentals',style: TextStyle(color: Colors.lightBlue),),
                //   children: [
                //
                //     _menu(
                //       menuTitle:'All Rentals',
                //       route:AllRentals.id,
                //     ),
                //
                //     _menu(
                //       menuTitle:'Add Rentals',
                //       route:AddRental.id,
                //     ),
                //
                //   ],
                // ),
                //
                // // if('$serve'=='Rentals')
                //   ExpansionTile(
                //     leading:Image.asset('assets/images/house.png',height: 30,width: 30,),
                //     title:const Text('Rentals',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Rentals',
                //         route:AllRentals.id,
                //       ),
                //
                //       _menu(
                //         menuTitle:'Add Rentals',
                //         route:AddRental.id,
                //       ),
                //
                //     ],
                //   ),
                //
                //
                // // if('$serve'=='Apartments')
                //   ExpansionTile(
                //     leading:Image.asset('assets/images/apartment.png',height: 30,width: 30,),
                //     title:const Text('Apartments',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Apartments',
                //         route:AllApart.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add Apartment',
                //         route:AddApart.id,
                //       ),
                //
                //
                //     ],
                //   ),
                //
                //
                //
                //
                // // if('$serve'=='Bangalows')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/home.png',height: 30,width: 30,),
                //     title:const Text('Bangalows',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Bangalows',
                //         route:AllBang.id,
                //       ),
                //
                //       _menu(
                //         menuTitle:'Add Bangalows',
                //         route:AddBang.id,
                //       ),
                //
                //     ],
                //   ),
                //
                //
                //
                // // if('$serve'=='Hostels')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/hostel.png',height: 30,width: 30,),
                //     title:const Text('Hostels',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Hostels',
                //         route:AllHostel.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add Hostel',
                //         route:AddHostel.id,
                //       ),
                //
                //
                //     ],
                //   ),
                //
                //
                //
                //
                // // if('$serve'=='Office Space')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/worker.png',height: 30,width: 30,),
                //     title:const Text('Office Space',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Hostels',
                //         route:Alloff.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add Hostel',
                //         route:AddOff.id,
                //       ),
                //
                //
                //     ],
                //   ),
                //
                //
                // // if('$serve'=='Land')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/land.png',height: 30,width: 30,),
                //     title:const Text('Land',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Land',
                //         route:AddLand.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add Land',
                //         route:AllLand.id,
                //       ),
                //
                //
                //     ],
                //   ),
                //
                //
                //
                // // if('$serve'=='Warehouses')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/warehouse.png',height: 30,width: 30,),
                //     title:const Text('Warehouses',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Warehouses',
                //         route:AllWare.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add WareHouse',
                //         route:AddWare.id,
                //       ),
                //
                //
                //     ],
                //   ),
                //
                //
                // // if('$serve'=='Tourist B & B')
                //   ExpansionTile(
                //     leading: Image.asset('assets/images/tourists.png',height: 30,width: 30,),
                //     title:const Text('Tourist B & B',style: TextStyle(color: Colors.lightBlue),),
                //     children: [
                //
                //       _menu(
                //         menuTitle:'All Tourist B & B',
                //         route:AllTour.id,
                //       ),
                //
                //
                //       _menu(
                //         menuTitle:'Add Tourist B & B',
                //         route:AddTour.id,
                //       ),
                //
                //
                //     ],
                //   ),


                // ExpansionTile(
                //   leading: const Icon(CupertinoIcons.person,color: Colors.lightBlue,),
                //   title:const Text('Account',style: TextStyle(color: Colors.lightBlue),),
                //   children: [
                //
                //     _menu(
                //       menuTitle:'Edit Personal Account',
                //       route:EditPersonalAccount.id,
                //     ),
                //
                //
                //     _menu(
                //       menuTitle:'Edit Business Account',
                //       route:EditBizAccount.id,
                //     ),
                //
                //
                //   ],
                // ),
                //


                //
                //
                // _menu(
                //   icon:Icons.notifications_outlined,
                //   menuTitle:'Notifications',
                //   route:Notifications.id,
                // ),
                //


                // _menu(
                //   icon:CupertinoIcons.gift,
                //   menuTitle:'Coupons',
                //   route:HomeScreen.id,
                // ),

                // _menu(
                //   icon:Icons.list_alt_outlined,
                //   menuTitle:'Bookings',
                //   route:Bookings.id,
                // ),
                //
                //
                //
                // _menu(
                //   icon:Icons.stacked_bar_chart_outlined,
                //   menuTitle:'Reports',
                //   route:Report.id,
                // ),
                //
                //
                // _menu(
                //   icon:Icons.settings_outlined,
                //   menuTitle:'Settings',
                //   route:Settingz.id,
                // ),

                // _menu(
                //   icon:Icons.arrow_back_ios,
                //   menuTitle:'LogOut',
                //   route:HomeScreen.id,
                // ),
              ],

            ),
          ),


        ],
      ),
    );
  }
}
